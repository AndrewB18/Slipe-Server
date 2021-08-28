﻿using SlipeServer.Packets.Definitions.Join;
using SlipeServer.Packets.Definitions.Lua.ElementRpc.Element;
using SlipeServer.Packets.Definitions.Lua.ElementRpc.Player;
using SlipeServer.Server.Elements;
using SlipeServer.Server.Elements.Enums;
using SlipeServer.Server.Enums;
using MTAServerWrapper.Packets.Outgoing.Connection;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Numerics;
using System.Text;
using SlipeServer.Packets.Definitions.Player;
using SlipeServer.Packets.Definitions.Lua.ElementRpc.Vehicle;

namespace SlipeServer.Server.PacketHandling.Factories
{
    public static class VehiclePacketFactory
    {
        public static SetElementModelRpcPacket CreateSetModelPacket(Vehicle vehicle)
        {
            return new SetElementModelRpcPacket(vehicle.Id, vehicle.Model, vehicle.Variant1, vehicle.Variant2);
        }

        public static SetVehicleLandingGearDownRpcPacket CreateSetLandingGearDownPacket(Vehicle vehicle)
        {
            return new SetVehicleLandingGearDownRpcPacket(vehicle.Id, vehicle.IsLandingGearDown);
        }

        public static SetVehicleTaxiLightOnRpcPacket CreateSetVehicleTaxiLightOnPacket(Vehicle vehicle)
        {
            return new SetVehicleTaxiLightOnRpcPacket(vehicle.Id, vehicle.IsTaxiLightOn);
        }

        public static SetVehicleTurretRotationRpcPacket CreateSetTurretRotationPacket(Vehicle vehicle)
        {
            return new SetVehicleTurretRotationRpcPacket(vehicle.Id, vehicle.TurretRotation!.Value);
        }

        public static SetVehiclePlateTextRpcPacket CreateSetPlateTextPacket(Vehicle vehicle)
        {
            return new SetVehiclePlateTextRpcPacket(vehicle.Id, vehicle.PlateText);
        }

        public static AddVehicleUpgradeRpcPacket CreateAddUpgradePacket(Vehicle vehicle, ushort upgradeId)
        {
            return new AddVehicleUpgradeRpcPacket(vehicle.Id, upgradeId);
        }

        public static RemoveVehicleUpgradeRpcPacket CreateRemoveUpgradePacket(Vehicle vehicle, ushort upgradeId)
        {
            return new RemoveVehicleUpgradeRpcPacket(vehicle.Id, upgradeId);
        }
    }
}
