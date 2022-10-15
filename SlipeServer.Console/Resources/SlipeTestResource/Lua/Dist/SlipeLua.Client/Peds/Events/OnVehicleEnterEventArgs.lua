-- Generated by CSharp.lua Compiler
local System = System
local SlipeLuaSharedElements = SlipeLua.Shared.Elements
local SlipeLuaClientVehicles
System.import(function (out)
  SlipeLuaClientVehicles = SlipeLua.Client.Vehicles
end)
System.namespace("SlipeLua.Client.Peds.Events", function (namespace)
  namespace.class("OnVehicleEnterEventArgs", function (namespace)
    local getVehicle, getSeat, __ctor__
    __ctor__ = function (this, vehicle, seat)
      this.Vehicle = SlipeLuaSharedElements.ElementManager.getInstance():GetElement(vehicle, SlipeLuaClientVehicles.BaseVehicle)
      this.Seat = System.cast(System.Int32, seat)
    end
    getVehicle = System.property("Vehicle", true)
    getSeat = System.property("Seat", true)
    return {
      getVehicle = getVehicle,
      Seat = 0,
      getSeat = getSeat,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "Seat", 0x206, System.Int32, getSeat },
            { "Vehicle", 0x206, out.SlipeLua.Client.Vehicles.BaseVehicle, getVehicle }
          },
          methods = {
            { ".ctor", 0x204, nil, out.SlipeLua.MtaDefinitions.MtaElement, System.Object }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
