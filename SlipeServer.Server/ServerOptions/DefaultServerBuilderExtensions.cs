﻿using MTAServerWrapper.Packets.Outgoing.Connection;
using SlipeServer.Packets.Definitions.Commands;
using SlipeServer.Packets.Definitions.Explosions;
using SlipeServer.Packets.Definitions.Join;
using SlipeServer.Packets.Definitions.Player;
using SlipeServer.Packets.Definitions.Satchels;
using SlipeServer.Packets.Definitions.Sync;
using SlipeServer.Packets.Definitions.Vehicles;
using SlipeServer.Packets.Definitions.Voice;
using SlipeServer.Packets.Lua.Event;
using SlipeServer.Packets.Rpc;
using SlipeServer.Server.AllSeeingEye;
using SlipeServer.Server.Behaviour;
using SlipeServer.Server.PacketHandling.Handlers.BulletSync;
using SlipeServer.Server.PacketHandling.Handlers.Command;
using SlipeServer.Server.PacketHandling.Handlers.Connection;
using SlipeServer.Server.PacketHandling.Handlers.Explosions;
using SlipeServer.Server.PacketHandling.Handlers.Player;
using SlipeServer.Server.PacketHandling.Handlers.Player.Sync;
using SlipeServer.Server.PacketHandling.Handlers.Projectile;
using SlipeServer.Server.PacketHandling.Handlers.Rpc;
using SlipeServer.Server.PacketHandling.Handlers.Satchel;
using SlipeServer.Server.PacketHandling.Handlers.Vehicle;
using SlipeServer.Server.PacketHandling.Handlers.Vehicle.Sync;
using SlipeServer.Server.PacketHandling.Handlers.Voice;
using System.IO;

namespace SlipeServer.Server.ServerOptions
{
    public static class DefaultServerBuilderExtensions
    {
        public static void AddDefaultQueueHandlers(this ServerBuilder builder)
        {
            builder.AddPacketHandler<JoinedGamePacketHandler, JoinedGamePacket>();
            builder.AddPacketHandler<JoinDataPacketHandler, PlayerJoinDataPacket>();
            builder.AddPacketHandler<PlayerQuitPacketHandler, PlayerQuitPacket>();
            builder.AddPacketHandler<PlayerTimeoutPacketHandler, PlayerTimeoutPacket>();

            builder.AddPacketHandler<PlayerPureSyncPacketHandler, PlayerPureSyncPacket>();
            builder.AddPacketHandler<KeySyncPacketHandler, KeySyncPacket>();
            builder.AddPacketHandler<CameraSyncPacketHandler, CameraSyncPacket>();

            builder.AddPacketHandler<WeaponBulletSyncPacketHandler, WeaponBulletSyncPacket>();
            builder.AddPacketHandler<PlayerBulletSyncPacketHandler, PlayerBulletSyncPacket>();

            builder.AddPacketHandler<ProjectileSyncPacketHandler, ProjectileSyncPacket>();

            builder.AddPacketHandler<ExplosionPacketHandler, ExplosionPacket>();

            builder.AddPacketHandler<CommandPacketHandler, CommandPacket>();

            builder.AddPacketHandler<DetonateSatchelsPacketHandler, DetonateSatchelsPacket>();
            builder.AddPacketHandler<DestroySatchelsPacketHandler, DestroySatchelsPacket>();

            builder.AddPacketHandler<RpcPacketHandler, RpcPacket>();

            builder.AddPacketHandler<LuaEventPacketHandler, LuaEventPacket>();

            builder.AddPacketHandler<PlayerAcInfoPacketHandler, PlayerACInfoPacket>();
            builder.AddPacketHandler<PlayerDiagnosticPacketHandler, PlayerDiagnosticPacket>();
            builder.AddPacketHandler<PlayerModInfoPacketHandler, PlayerModInfoPacket>();
            builder.AddPacketHandler<PlayerNetworkStatusPacketHandler, PlayerNetworkStatusPacket>();
            builder.AddPacketHandler<PlayerScreenshotPacketHandler, PlayerScreenshotPacket>();
            builder.AddPacketHandler<PlayerWastedPacketHandler, PlayerWastedPacket>();

            builder.AddPacketHandler<VehicleInOutPacketHandler, VehicleInOutPacket>();
            builder.AddPacketHandler<VehiclePureSyncPacketHandler, VehiclePureSyncPacket>();

            builder.AddPacketHandler<VoiceDataPacketHandler, VoiceDataPacket>();
            builder.AddPacketHandler<VoiceEndPacketHandler, VoiceEndPacket>();
        }

        public static void AddDefaultBehaviours(this ServerBuilder builder)
        {
            builder.AddBehaviour<AseBehaviour>();
            builder.AddBehaviour<MasterServerAnnouncementBehaviour>("http://master.mtasa.com/ase/add.php");

            builder.AddBehaviour<EventLoggingBehaviour>();
            builder.AddBehaviour<VelocityBehaviour>();
            builder.AddBehaviour<DefaultChatBehaviour>();
            builder.AddBehaviour<NicknameChangeBehaviour>();
            builder.AddBehaviour<CollisionShapeBehaviour>();

            builder.AddBehaviour<PlayerJoinElementBehaviour>();

            builder.AddBehaviour<ElementPacketBehaviour>();
            builder.AddBehaviour<PedPacketBehaviour>();
            builder.AddBehaviour<PlayerPacketBehaviour>();
            builder.AddBehaviour<VehicleWarpBehaviour>();
            builder.AddBehaviour<VoiceBehaviour>();
            builder.AddBehaviour<LightSyncBehaviour>();
            builder.AddBehaviour<TeamBehaviour>();
            builder.AddBehaviour<RadarAreaBehaviour>();
            builder.AddBehaviour<BlipBehaviour>();
            builder.AddBehaviour<ObjectPacketBehaviour>();
            builder.AddBehaviour<VehicleBehaviour>();
        }

        public static void AddDefaults(this ServerBuilder builder)
        {
            builder.AddDefaultQueueHandlers();
            builder.AddDefaultBehaviours();

            builder.AddNetWrapper(
                Directory.GetCurrentDirectory(),
                "net",
                builder.Configuration.Host,
                builder.Configuration.Port,
                builder.Configuration.AntiCheat);
        }
    }
}
