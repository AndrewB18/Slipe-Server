﻿using SlipeServer.Packets.Definitions.Join;
using SlipeServer.Packets.Enums;
using SlipeServer.Server.Elements;
using SlipeServer.Server.Enums;
using SlipeServer.Server.PacketHandling.Factories;
using SlipeServer.Server.Repositories;
using MTAServerWrapper.Packets.Outgoing.Connection;
using System;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using SlipeServer.Server.Extensions;
using System.Linq;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;

namespace SlipeServer.Server.PacketHandling.QueueHandlers
{
    public class ConnectionQueueHandler : WorkerBasedQueueHandler
    {
        private readonly ILogger logger;
        private readonly MtaServer server;
        private readonly IElementRepository elementRepository;

        public override IEnumerable<PacketId> SupportedPacketIds => new PacketId[] { 
            PacketId.PACKET_ID_PLAYER_JOIN,
            PacketId.PACKET_ID_PLAYER_JOINDATA,
            PacketId.PACKET_ID_PLAYER_QUIT,
            PacketId.PACKET_ID_PLAYER_TIMEOUT,
            PacketId.PACKET_ID_PLAYER_NO_SOCKET
        };

        public ConnectionQueueHandler(
            ILogger logger,
            MtaServer server, 
            IElementRepository elementRepository, 
            int sleepInterval, 
            int workerCount
        ) : base(sleepInterval, workerCount)
        {
            this.logger = logger;
            this.server = server;
            this.elementRepository = elementRepository;
        }

        protected override void HandlePacket(PacketQueueEntry queueEntry)
        {
            try
            {
                switch (queueEntry.PacketId)
                {
                    case PacketId.PACKET_ID_PLAYER_JOIN:
                        HandleClientJoin(queueEntry.Client);
                        break;
                    case PacketId.PACKET_ID_PLAYER_JOINDATA:
                        PlayerJoinDataPacket joinDataPacket = new PlayerJoinDataPacket();
                        joinDataPacket.Read(queueEntry.Data);
                        HandleClientJoinData(queueEntry.Client, joinDataPacket);
                        break;
                    case PacketId.PACKET_ID_PLAYER_QUIT:
                        HandleClientQuit(queueEntry.Client, QuitReason.Quit);
                        break;
                    case PacketId.PACKET_ID_PLAYER_TIMEOUT:
                    case PacketId.PACKET_ID_PLAYER_NO_SOCKET:
                        HandleClientQuit(queueEntry.Client, QuitReason.Timeout);
                        break;
                }
            } catch (Exception e)
            {
                this.logger.LogError($"Handling packet ({queueEntry.PacketId}) failed.\n{e.Message}");
            }
        }

        private void HandleClientJoin(Client client)
        {
            client.SendPacket(new ModNamePacket(0x06D, "deathmatch"));
        }

        private void HandleClientJoinData(Client client, PlayerJoinDataPacket joinDataPacket)
        {
            string osName =
                RuntimeInformation.IsOSPlatform(OSPlatform.Windows) ? "Windows" :
                RuntimeInformation.IsOSPlatform(OSPlatform.OSX) ? "Mac OS" :
                RuntimeInformation.IsOSPlatform(OSPlatform.Linux) ? "Linux" :
                RuntimeInformation.IsOSPlatform(OSPlatform.FreeBSD) ? "Free BSD" :
                "Unknown";
            client.SendPacket(new JoinCompletePacket($"Slipe Server 0.1.0 [{osName}]\0", "1.5.7-9.0.0"));

            client.Player.RunAsSync(() =>
            {
                client.Player.Name = joinDataPacket.Nickname;
            });
            client.SetVersion(joinDataPacket.BitStreamVersion);
            client.FetchSerial();
        }

        private void HandleClientQuit(Client client, QuitReason reason)
        {
            var packet = PlayerPacketFactory.CreateQuitPacket(client.Player, reason);
            packet.SendTo(this.elementRepository.GetByType<Player>(ElementType.Player).Except(new Player[] { client.Player }));

            client.Player.Destroy();
        }
    }
}
