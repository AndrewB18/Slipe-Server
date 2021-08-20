﻿using SlipeServer.Packets.Builder;
using SlipeServer.Packets.Enums;
using SlipeServer.Packets.Reader;
using System.Drawing;
using System.Numerics;

namespace SlipeServer.Packets.Definitions.Lua.ElementRpc.Ped
{
    public class SetRadarAreaColorPacket : Packet
    {
        public override PacketId PacketId => PacketId.PACKET_ID_LUA_ELEMENT_RPC;

        public override PacketReliability Reliability => PacketReliability.ReliableSequenced;

        public override PacketPriority Priority => PacketPriority.High;

        public uint ElementId { get; }
        public Color Color { get; }

        public SetRadarAreaColorPacket(uint elementId, Color color)
        {
            this.ElementId = elementId;
            this.Color = color;
        }

        public override void Read(byte[] bytes)
        {

        }

        public override byte[] Write()
        {
            var builder = new PacketBuilder();
            builder.Write((byte)ElementRpcFunction.SET_RADAR_AREA_COLOR);
            builder.WriteElementId(this.ElementId);
            builder.Write(this.Color.R);
            builder.Write(this.Color.G);
            builder.Write(this.Color.B);
            builder.Write(this.Color.A);

            return builder.Build();
        }
    }
}
