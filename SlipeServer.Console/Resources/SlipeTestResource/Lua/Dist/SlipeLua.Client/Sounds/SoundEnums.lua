-- Generated by CSharp.lua Compiler
local System = System
System.namespace("SlipeLua.Client.Sounds", function (namespace)
  --/ <summary>
  --/ Represents different sound containers
  --/ </summary>
  namespace.enum("SoundContainer", function ()
    return {
      feet = 0,
      genrl = 1,
      pain_a = 2,
      script = 3,
      spc_ea = 4,
      spc_fa = 5,
      spc_na = 6,
      spc_pa = 7,
      __metadata__ = function (out)
        return {
          fields = {
            { "feet", 0xE, System.Int32 },
            { "genrl", 0xE, System.Int32 },
            { "pain_a", 0xE, System.Int32 },
            { "script", 0xE, System.Int32 },
            { "spc_ea", 0xE, System.Int32 },
            { "spc_fa", 0xE, System.Int32 },
            { "spc_na", 0xE, System.Int32 },
            { "spc_pa", 0xE, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
  end)

  --/ <summary>
  --/ Represents different radio stations
  --/ </summary>
  namespace.enum("RadioStation", function ()
    return {
      RadioOff = 0,
      PlaybackFM = 1,
      KRose = 2,
      KDST = 3,
      BounceFM = 4,
      SFUR = 5,
      RadioLosSantos = 6,
      RadioX = 7,
      CSR1039 = 8,
      KJahWest = 9,
      MasterSounds983 = 10,
      WCTR = 11,
      UserTrackPlayer = 12,
      __metadata__ = function (out)
        return {
          fields = {
            { "BounceFM", 0xE, System.Int32 },
            { "CSR1039", 0xE, System.Int32 },
            { "KDST", 0xE, System.Int32 },
            { "KJahWest", 0xE, System.Int32 },
            { "KRose", 0xE, System.Int32 },
            { "MasterSounds983", 0xE, System.Int32 },
            { "PlaybackFM", 0xE, System.Int32 },
            { "RadioLosSantos", 0xE, System.Int32 },
            { "RadioOff", 0xE, System.Int32 },
            { "RadioX", 0xE, System.Int32 },
            { "SFUR", 0xE, System.Int32 },
            { "UserTrackPlayer", 0xE, System.Int32 },
            { "WCTR", 0xE, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
  end)

  --/ <summary>
  --/ Represents interal GTA radio stations that are not the common ones
  --/ </summary>
  namespace.enum("ExtraStations", function ()
    return {
      Adverts = 0,
      Ambience = 1,
      Police = 2,
      Custscene = 3,
      Beats = 4,
      __metadata__ = function (out)
        return {
          fields = {
            { "Adverts", 0xE, System.Int32 },
            { "Ambience", 0xE, System.Int32 },
            { "Beats", 0xE, System.Int32 },
            { "Custscene", 0xE, System.Int32 },
            { "Police", 0xE, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)