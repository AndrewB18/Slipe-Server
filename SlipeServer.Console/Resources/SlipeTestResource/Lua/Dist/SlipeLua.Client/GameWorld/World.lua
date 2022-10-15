-- Generated by CSharp.lua Compiler
local System = System
local SlipeLuaMtaDefinitions = SlipeLua.MtaDefinitions
local SlipeLuaSharedGameWorld = SlipeLua.Shared.GameWorld
local SlipeLuaClientGameWorld
System.import(function (out)
  SlipeLuaClientGameWorld = SlipeLua.Client.GameWorld
end)
System.namespace("SlipeLua.Client.GameWorld", function (namespace)
  namespace.class("World", function (namespace)
    local getInstance1, getInteriorSounds1, setInteriorSounds1, getPedsLodDistance, setPedsLodDistance, getVehiclesLodDistance, setVehiclesLodDistance, getTrainsAndPlanesLodDistance, 
    setTrainsAndPlanesLodDistance, getBirdsEnabled, setBirdsEnabled, getWaterDrawnLast, setWaterDrawnLast, getPedTargetingMarkersEnabled, setPedTargetingMarkersEnabled, GetGarage1, 
    GetGroundPosition, ResetVehiclesLodDistance, ResetPedsLodDistance, SetAmbientSoundEnabled, IsAmbientSoundEnabled, ResetAmbientSounds, IsSoundEnabled, ResetWorldSounds, 
    SetSoundEnabled, SetSpecialPropertyEnabled, IsSpecialPropertyEnabled, SetRoomFurnitureEnabled, IsRoomFurnitureEnabled, GetWaterLevelAtPosition, GetSurfaceProperty, SetSurfaceProperty, 
    ResetSurfaceProperty, class, __ctor__
    __ctor__ = function (this)
      SlipeLuaSharedGameWorld.SharedWorld.__ctor__(this)
    end
    getInstance1 = function ()
      if SlipeLuaSharedGameWorld.SharedWorld.instance == nil then
        SlipeLuaSharedGameWorld.SharedWorld.instance = class()
      end
      return System.cast(class, SlipeLuaSharedGameWorld.SharedWorld.instance)
    end
    getInteriorSounds1 = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetInteriorSoundsEnabled()
    end
    setInteriorSounds1 = function (this, value)
      SlipeLuaMtaDefinitions.MtaShared.SetInteriorSoundsEnabled(value)
    end
    getPedsLodDistance = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetPedsLODDistance()
    end
    setPedsLodDistance = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetPedsLODDistance(math.Max(math.Min(value, 0), 500))
    end
    getVehiclesLodDistance = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetVehiclesLODDistance()[1]
    end
    setVehiclesLodDistance = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetVehiclesLODDistance(value, getTrainsAndPlanesLodDistance(this))
    end
    getTrainsAndPlanesLodDistance = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetVehiclesLODDistance()[2]
    end
    setTrainsAndPlanesLodDistance = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetVehiclesLODDistance(getVehiclesLodDistance(this), value)
    end
    getBirdsEnabled = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetBirdsEnabled()
    end
    setBirdsEnabled = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetBirdsEnabled(value)
    end
    getWaterDrawnLast = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.IsWaterDrawnLast()
    end
    setWaterDrawnLast = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetWaterDrawnLast(value)
    end
    getPedTargetingMarkersEnabled = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.IsPedTargetingMarkerEnabled()
    end
    setPedTargetingMarkersEnabled = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetPedTargetingMarkerEnabled(value)
    end
    GetGarage1 = function (this, garage)
      return SlipeLuaClientGameWorld.Garage(garage)
    end
    GetGroundPosition = function (this, position)
      return SlipeLuaMtaDefinitions.MtaClient.GetGroundPosition(position.X, position.Y, position.Z)
    end
    ResetVehiclesLodDistance = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.ResetVehiclesLODDistance()
    end
    ResetPedsLodDistance = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.ResetPedsLODDistance()
    end
    SetAmbientSoundEnabled = function (this, soundType, enable)
      return SlipeLuaMtaDefinitions.MtaClient.SetAmbientSoundEnabled(soundType:EnumToString(SlipeLuaClientGameWorld.AmbientSound):ToLower(), enable)
    end
    IsAmbientSoundEnabled = function (this, soundType)
      return SlipeLuaMtaDefinitions.MtaClient.IsAmbientSoundEnabled(soundType:EnumToString(SlipeLuaClientGameWorld.AmbientSound):ToLower())
    end
    ResetAmbientSounds = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.ResetAmbientSounds()
    end
    IsSoundEnabled = function (this, group, index)
      return SlipeLuaMtaDefinitions.MtaClient.IsWorldSoundEnabled(group, index)
    end
    ResetWorldSounds = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.ResetWorldSounds()
    end
    SetSoundEnabled = function (this, group, enable, index, immediate)
      return SlipeLuaMtaDefinitions.MtaClient.SetWorldSoundEnabled(group, index, enable, immediate)
    end
    SetSpecialPropertyEnabled = function (this, property, enable)
      return SlipeLuaMtaDefinitions.MtaClient.SetWorldSpecialPropertyEnabled(property:EnumToString(SlipeLuaClientGameWorld.WorldSpecialProperty):ToLower(), enable)
    end
    IsSpecialPropertyEnabled = function (this, property)
      return SlipeLuaMtaDefinitions.MtaClient.IsWorldSpecialPropertyEnabled(property:EnumToString(SlipeLuaClientGameWorld.WorldSpecialProperty):ToLower())
    end
    SetRoomFurnitureEnabled = function (this, room, enabled)
      return SlipeLuaMtaDefinitions.MtaClient.SetInteriorFurnitureEnabled(room, enabled)
    end
    IsRoomFurnitureEnabled = function (this, room)
      return SlipeLuaMtaDefinitions.MtaClient.GetInteriorFurnitureEnabled(room)
    end
    GetWaterLevelAtPosition = function (this, position, checkWaves)
      return SlipeLuaMtaDefinitions.MtaClient.GetWaterLevel(position.X, position.Y, position.Z, checkWaves)
    end
    GetSurfaceProperty = function (this, type, property)
      return SlipeLuaMtaDefinitions.MtaClient.EngineGetSurfaceProperties(type, property:EnumToString(SlipeLuaClientGameWorld.SurfaceMaterialProperty):ToLower())
    end
    SetSurfaceProperty = function (this, type, property, value)
      SlipeLuaMtaDefinitions.MtaClient.EngineSetSurfaceProperties(type, property:EnumToString(SlipeLuaClientGameWorld.SurfaceMaterialProperty):ToLower(), value)
    end
    ResetSurfaceProperty = function (this, type)
      SlipeLuaMtaDefinitions.MtaClient.EngineResetSurfaceProperties(type)
    end
    class = {
      base = function (out)
        return {
          out.SlipeLua.Shared.GameWorld.SharedWorld
        }
      end,
      getInstance1 = getInstance1,
      getInteriorSounds1 = getInteriorSounds1,
      setInteriorSounds1 = setInteriorSounds1,
      getPedsLodDistance = getPedsLodDistance,
      setPedsLodDistance = setPedsLodDistance,
      getVehiclesLodDistance = getVehiclesLodDistance,
      setVehiclesLodDistance = setVehiclesLodDistance,
      getTrainsAndPlanesLodDistance = getTrainsAndPlanesLodDistance,
      setTrainsAndPlanesLodDistance = setTrainsAndPlanesLodDistance,
      getBirdsEnabled = getBirdsEnabled,
      setBirdsEnabled = setBirdsEnabled,
      getWaterDrawnLast = getWaterDrawnLast,
      setWaterDrawnLast = setWaterDrawnLast,
      getPedTargetingMarkersEnabled = getPedTargetingMarkersEnabled,
      setPedTargetingMarkersEnabled = setPedTargetingMarkersEnabled,
      GetGarage1 = GetGarage1,
      GetGroundPosition = GetGroundPosition,
      ResetVehiclesLodDistance = ResetVehiclesLodDistance,
      ResetPedsLodDistance = ResetPedsLodDistance,
      SetAmbientSoundEnabled = SetAmbientSoundEnabled,
      IsAmbientSoundEnabled = IsAmbientSoundEnabled,
      ResetAmbientSounds = ResetAmbientSounds,
      IsSoundEnabled = IsSoundEnabled,
      ResetWorldSounds = ResetWorldSounds,
      SetSoundEnabled = SetSoundEnabled,
      SetSpecialPropertyEnabled = SetSpecialPropertyEnabled,
      IsSpecialPropertyEnabled = IsSpecialPropertyEnabled,
      SetRoomFurnitureEnabled = SetRoomFurnitureEnabled,
      IsRoomFurnitureEnabled = IsRoomFurnitureEnabled,
      GetWaterLevelAtPosition = GetWaterLevelAtPosition,
      GetSurfaceProperty = GetSurfaceProperty,
      SetSurfaceProperty = SetSurfaceProperty,
      ResetSurfaceProperty = ResetSurfaceProperty,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "BirdsEnabled", 0x106, System.Boolean, getBirdsEnabled, setBirdsEnabled },
            { "Instance", 0x20E, class, getInstance1 },
            { "InteriorSounds", 0x106, System.Boolean, getInteriorSounds1, setInteriorSounds1 },
            { "PedTargetingMarkersEnabled", 0x106, System.Boolean, getPedTargetingMarkersEnabled, setPedTargetingMarkersEnabled },
            { "PedsLodDistance", 0x106, System.Single, getPedsLodDistance, setPedsLodDistance },
            { "TrainsAndPlanesLodDistance", 0x106, System.Single, getTrainsAndPlanesLodDistance, setTrainsAndPlanesLodDistance },
            { "VehiclesLodDistance", 0x106, System.Single, getVehiclesLodDistance, setVehiclesLodDistance },
            { "WaterDrawnLast", 0x106, System.Boolean, getWaterDrawnLast, setWaterDrawnLast }
          },
          methods = {
            { ".ctor", 0x6, nil },
            { "GetGarage", 0x186, GetGarage1, System.Int32, out.SlipeLua.Client.GameWorld.Garage },
            { "GetGroundPosition", 0x186, GetGroundPosition, System.Numerics.Vector3, System.Single },
            { "GetSurfaceProperty", 0x286, GetSurfaceProperty, System.Int32, System.Int32, System.Object },
            { "GetWaterLevelAtPosition", 0x286, GetWaterLevelAtPosition, System.Numerics.Vector3, System.Boolean, System.Single },
            { "IsAmbientSoundEnabled", 0x186, IsAmbientSoundEnabled, System.Int32, System.Boolean },
            { "IsRoomFurnitureEnabled", 0x186, IsRoomFurnitureEnabled, System.Int32, System.Boolean },
            { "IsSoundEnabled", 0x286, IsSoundEnabled, System.Int32, System.Int32, System.Boolean },
            { "IsSpecialPropertyEnabled", 0x186, IsSpecialPropertyEnabled, System.Int32, System.Boolean },
            { "ResetAmbientSounds", 0x86, ResetAmbientSounds, System.Boolean },
            { "ResetPedsLodDistance", 0x86, ResetPedsLodDistance, System.Boolean },
            { "ResetSurfaceProperty", 0x106, ResetSurfaceProperty, System.Int32 },
            { "ResetVehiclesLodDistance", 0x86, ResetVehiclesLodDistance, System.Boolean },
            { "ResetWorldSounds", 0x86, ResetWorldSounds, System.Boolean },
            { "SetAmbientSoundEnabled", 0x286, SetAmbientSoundEnabled, System.Int32, System.Boolean, System.Boolean },
            { "SetRoomFurnitureEnabled", 0x286, SetRoomFurnitureEnabled, System.Int32, System.Boolean, System.Boolean },
            { "SetSoundEnabled", 0x486, SetSoundEnabled, System.Int32, System.Boolean, System.Int32, System.Boolean, System.Boolean },
            { "SetSpecialPropertyEnabled", 0x286, SetSpecialPropertyEnabled, System.Int32, System.Boolean, System.Boolean },
            { "SetSurfaceProperty", 0x306, SetSurfaceProperty, System.Int32, System.Int32, System.Object }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)
end)
