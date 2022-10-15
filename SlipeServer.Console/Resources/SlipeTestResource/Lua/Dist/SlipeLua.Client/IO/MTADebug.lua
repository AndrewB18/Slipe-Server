-- Generated by CSharp.lua Compiler
local System = System
local SlipeLuaMtaDefinitions = SlipeLua.MtaDefinitions
System.namespace("SlipeLua.Client.IO", function (namespace)
  namespace.class("MtaDebug", function (namespace)
    local getActive, setActive, addOnMessage, removeOnMessage, class
    getActive = function ()
      return SlipeLuaMtaDefinitions.MtaClient.IsDebugViewActive()
    end
    setActive = function (value)
      SlipeLuaMtaDefinitions.MtaClient.SetDebugViewActive(value)
    end
    addOnMessage = function (value)
      class.OnMessage = class.OnMessage + value
    end
    removeOnMessage = function (value)
      class.OnMessage = class.OnMessage - value
    end
    class = {
      base = function (out)
        return {
          out.SlipeLua.Shared.IO.SharedMtaDebug
        }
      end,
      getActive = getActive,
      setActive = setActive,
      addOnMessage = addOnMessage,
      removeOnMessage = removeOnMessage,
      __metadata__ = function (out)
        return {
          properties = {
            { "Active", 0x10E, System.Boolean, getActive, setActive }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)
end)
