-- Generated by CSharp.lua Compiler
local System = System
local SlipeLuaMtaDefinitions = SlipeLua.MtaDefinitions
local SlipeLuaCollisionShapes
System.import(function (out)
  SlipeLuaCollisionShapes = SlipeLua.Shared.CollisionShapes
end)
System.namespace("SlipeLua.Shared.CollisionShapes", function (namespace)
  --/ <summary>
  --/ This is a shape that has a position and a radius and infinite height that you can use to detect a player's presence.
  --/ </summary>
  namespace.class("CollisionCircle", function (namespace)
    local __ctor1__, __ctor2__
    __ctor1__ = function (this, element)
      SlipeLuaCollisionShapes.CollisionShape.__ctor__(this, element)
    end
    __ctor2__ = function (this, position, radius)
      __ctor1__(this, SlipeLuaMtaDefinitions.MtaShared.CreateColCircle(position.X, position.Y, radius))
    end
    return {
      base = function (out)
        return {
          out.SlipeLua.Shared.CollisionShapes.CollisionShape
        }
      end,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x106, __ctor1__, out.SlipeLua.MtaDefinitions.MtaElement },
            { ".ctor", 0x206, __ctor2__, System.Numerics.Vector2, System.Single }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
