﻿using Microsoft.Extensions.Logging;
using SlipeServer.Packets;
using SlipeServer.Packets.Enums;
using SlipeServer.Server.Clients;
using SlipeServer.Server.PacketHandling.Handlers;
using System;
using System.Collections.Generic;

namespace SlipeServer.Server.PacketHandling;

/// <summary>
/// Class responsible for routing packets to the appropriate queues
/// </summary>
public class PacketReducer
{
    private readonly List<IQueueHandler> queueHandlers;
    private readonly Dictionary<PacketId, List<IQueueHandler>> registeredQueueHandlers;
    private readonly Dictionary<PacketId, List<Action<IClient, byte[]>>> registeredPacketHandlerActions;
    private readonly ILogger logger;

    public IEnumerable<IQueueHandler> RegisteredQueueHandlers => this.queueHandlers;

    public PacketReducer(ILogger logger)
    {
        this.queueHandlers = new();
        this.registeredQueueHandlers = new();
        this.registeredPacketHandlerActions = new();
        this.logger = logger;
    }

    public void UnregisterQueueHandler(PacketId packetId, IQueueHandler queueHandler)
    {
        if (this.registeredQueueHandlers.TryGetValue(packetId, out var value))
        {
            value.Remove(queueHandler);
        }
        this.queueHandlers.Add(queueHandler);
    }

    public void EnqueuePacket(IClient client, PacketId packetId, byte[] data)
    {
        if (this.registeredPacketHandlerActions.TryGetValue(packetId, out var handlers))
        {
            foreach (var handler in handlers)
                try
                {
                    handler(client, data);
                }
                catch (Exception e)
                {
                    this.logger.LogError("Enqueueing packet ({packetId}) failed.\n{message}\n{stackTrace}", packetId, e.Message, e.StackTrace);
                }
        } else if (packetId != PacketId.PACKET_ID_PLAYER_NO_SOCKET)
        {
            this.logger.LogWarning("Received unregistered packet {packetId}", packetId);
        }

        if (this.registeredQueueHandlers.TryGetValue(packetId, out var value))
        {
            foreach (IQueueHandler queueHandler in value)
            {
                queueHandler.EnqueuePacket(client, packetId, data);
                this.logger.LogWarning("Use of deprecated queue handler {packetId} {queueHandler}", packetId, queueHandler);
            }
        }
    }

    public void RegisterPacketHandler<TPacket>(PacketId packetId, IPacketQueueHandler<TPacket> handler) where TPacket : Packet, new()
    {
        if (!this.registeredPacketHandlerActions.ContainsKey(packetId))
        {
            this.registeredPacketHandlerActions[packetId] = new();
        }

        var pool = new PacketPool<TPacket>();
        this.registeredPacketHandlerActions[packetId].Add((client, data) =>
        {
            var packet = pool.GetPacket();
            packet.Read(data);
            handler.EnqueuePacket(client, packet);
        });
        handler.PacketHandled += (packet) => pool.ReturnPacket(packet);
    }
}
