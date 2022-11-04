-- Generated by CSharp.lua Compiler
local System = System
local SlipeLuaMtaDefinitions = SlipeLua.MtaDefinitions
local SlipeLuaSharedElements = SlipeLua.Shared.Elements
local ArraySingle = System.Array(System.Single)
local SlipeLuaClientSounds
System.import(function (out)
  SlipeLuaClientSounds = SlipeLua.Client.Sounds
end)
System.namespace("SlipeLua.Client.Sounds", function (namespace)
  --/ <summary>
  --/ Represents a sound played for the player
  --/ </summary>
  namespace.class("Sound", function (namespace)
    local getBpm, getBufferLength, getEffects, getLength, getLevelData, getMetaTags, getPan, setPan, 
    getTrackPosition, setTrackPosition, getProperties, getSpeed, setSpeed, getVolume, setVolume, getPaused, 
    setPaused, GetFftData, Destroy, GetSfxStatus, addOnBeat, removeOnBeat, addOnMetaChanged, removeOnMetaChanged, 
    addOnDownloadFinished, removeOnDownloadFinished, addOnStart, removeOnStart, addOnStop, removeOnStop, addOnStream, removeOnStream, 
    __ctor1__, __ctor2__, __ctor3__, __ctor4__, __ctor5__, __ctor6__
    __ctor1__ = function (this, element)
      SlipeLuaSharedElements.Element.__ctor__[2](this, element)
    end
    __ctor2__ = function (this, pathOrUrl, looped, throttled)
      __ctor1__(this, SlipeLuaMtaDefinitions.MtaClient.PlaySound(pathOrUrl, looped, throttled))
    end
    __ctor3__ = function (this, container, bankId, soundId, looped)
      __ctor1__(this, SlipeLuaMtaDefinitions.MtaClient.PlaySFX(container:EnumToString(SlipeLuaClientSounds.SoundContainer):ToLower(), bankId, soundId, looped))
    end
    __ctor4__ = function (this, station, trackId, looped)
      __ctor1__(this, SlipeLuaMtaDefinitions.MtaClient.PlaySFX("radio", SlipeLuaMtaDefinitions.MtaClient.GetRadioChannelName(station), trackId, looped))
    end
    __ctor5__ = function (this, station, trackId, looped)
      __ctor1__(this, SlipeLuaMtaDefinitions.MtaClient.PlaySFX("radio", station:EnumToString(SlipeLuaClientSounds.ExtraStations), trackId, looped))
    end
    __ctor6__ = function (this, player)
      SlipeLuaSharedElements.Element.__ctor__(this)
      this.element = player:getMTAElement()
    end
    getBpm = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetSoundBPM(this.element)
    end
    getBufferLength = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetSoundBufferLength(this.element)
    end
    getEffects = function (this)
      if this.effects == nil then
        this.effects = SlipeLuaClientSounds.SoundEffects(this)
      end
      return this.effects
    end
    getLength = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetSoundLength(this.element)
    end
    getLevelData = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetSoundLevelData(this.element)
    end
    getMetaTags = function (this)
      if this.meta == nil then
        this.meta = SlipeLuaClientSounds.SoundMeta(this)
      end
      return this.meta
    end
    getPan = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetSoundPan(this.element)
    end
    setPan = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetSoundPan(this.element, value)
    end
    getTrackPosition = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetSoundPosition(this.element)
    end
    setTrackPosition = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetSoundPosition(this.element, value)
    end
    getProperties = function (this)
      if this.properties == nil then
        this.properties = SlipeLuaClientSounds.SoundProperties(this)
      end
      return this.properties
    end
    getSpeed = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetSoundSpeed(this.element)
    end
    setSpeed = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetSoundSpeed(this.element, value)
    end
    getVolume = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GetSoundVolume(this.element)
    end
    setVolume = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetSoundVolume(this.element, value)
    end
    getPaused = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.IsSoundPaused(this.element)
    end
    setPaused = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.SetSoundPaused(this.element, value)
    end
    GetFftData = function (this, iSamples, iBands)
      local raw = SlipeLuaMtaDefinitions.MtaShared.GetDictionaryFromTable(SlipeLuaMtaDefinitions.MtaClient.GetSoundFFTData(this.element, iSamples, iBands), "System.Int32", "System.Single")
      local fftData = ArraySingle(raw:getCount())
      for _, pair in System.each(raw) do
        fftData:set(pair[1], pair[2])
      end
      return fftData
    end
    Destroy = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.StopSound(this.element)
    end
    GetSfxStatus = function (container)
      return SlipeLuaMtaDefinitions.MtaClient.GetSFXStatus(container:EnumToString(SlipeLuaClientSounds.SoundContainer):ToLower())
    end
    addOnBeat, removeOnBeat = System.event("OnBeat")
    addOnMetaChanged, removeOnMetaChanged = System.event("OnMetaChanged")
    addOnDownloadFinished, removeOnDownloadFinished = System.event("OnDownloadFinished")
    addOnStart, removeOnStart = System.event("OnStart")
    addOnStop, removeOnStop = System.event("OnStop")
    addOnStream, removeOnStream = System.event("OnStream")
    return {
      base = function (out)
        return {
          out.SlipeLua.Shared.Elements.Element
        }
      end,
      getBpm = getBpm,
      getBufferLength = getBufferLength,
      getEffects = getEffects,
      getLength = getLength,
      getLevelData = getLevelData,
      getMetaTags = getMetaTags,
      getPan = getPan,
      setPan = setPan,
      getTrackPosition = getTrackPosition,
      setTrackPosition = setTrackPosition,
      getProperties = getProperties,
      getSpeed = getSpeed,
      setSpeed = setSpeed,
      getVolume = getVolume,
      setVolume = setVolume,
      getPaused = getPaused,
      setPaused = setPaused,
      GetFftData = GetFftData,
      Destroy = Destroy,
      GetSfxStatus = GetSfxStatus,
      addOnBeat = addOnBeat,
      removeOnBeat = removeOnBeat,
      addOnMetaChanged = addOnMetaChanged,
      removeOnMetaChanged = removeOnMetaChanged,
      addOnDownloadFinished = addOnDownloadFinished,
      removeOnDownloadFinished = removeOnDownloadFinished,
      addOnStart = addOnStart,
      removeOnStart = removeOnStart,
      addOnStop = addOnStop,
      removeOnStop = removeOnStop,
      addOnStream = addOnStream,
      removeOnStream = removeOnStream,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__,
        __ctor4__,
        __ctor5__,
        __ctor6__
      },
      __metadata__ = function (out)
        return {
          properties = {
            { "Bpm", 0x206, System.Int32, getBpm },
            { "BufferLength", 0x206, System.Single, getBufferLength },
            { "Effects", 0x206, out.SlipeLua.Client.Sounds.SoundEffects, getEffects },
            { "Length", 0x206, System.Single, getLength },
            { "LevelData", 0x206, System.Tuple, getLevelData },
            { "MetaTags", 0x206, out.SlipeLua.Client.Sounds.SoundMeta, getMetaTags },
            { "Pan", 0x106, System.Single, getPan, setPan },
            { "Paused", 0x106, System.Boolean, getPaused, setPaused },
            { "Properties", 0x206, out.SlipeLua.Client.Sounds.SoundProperties, getProperties },
            { "Speed", 0x106, System.Single, getSpeed, setSpeed },
            { "TrackPosition", 0x106, System.Single, getTrackPosition, setTrackPosition },
            { "Volume", 0x106, System.Single, getVolume, setVolume }
          },
          fields = {
            { "effects", 0x1, out.SlipeLua.Client.Sounds.SoundEffects },
            { "meta", 0x1, out.SlipeLua.Client.Sounds.SoundMeta },
            { "properties", 0x1, out.SlipeLua.Client.Sounds.SoundProperties }
          },
          methods = {
            { ".ctor", 0x106, __ctor1__, out.SlipeLua.MtaDefinitions.MtaElement },
            { ".ctor", 0x306, __ctor2__, System.String, System.Boolean, System.Boolean },
            { ".ctor", 0x406, __ctor3__, System.Int32, System.Int32, System.Int32, System.Boolean },
            { ".ctor", 0x306, __ctor4__, System.Int32, System.Int32, System.Boolean },
            { ".ctor", 0x306, __ctor5__, System.Int32, System.Int32, System.Boolean },
            { ".ctor", 0x106, __ctor6__, out.SlipeLua.Client.Peds.Player },
            { "Destroy", 0x86, Destroy, System.Boolean },
            { "GetFftData", 0x286, GetFftData, System.Int32, System.Int32, System.Array(System.Single) },
            { "GetSfxStatus", 0x18E, GetSfxStatus, System.Int32, System.Boolean }
          },
          class = { 0x6, System.new(out.SlipeLua.Shared.Elements.DefaultElementClassAttribute, 2, 28 --[[ElementType.Sound]]) }
        }
      end
    }
  end)
end)