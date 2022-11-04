-- Generated by CSharp.lua Compiler
local System = System
local SlipeLuaMtaDefinitions = SlipeLua.MtaDefinitions
local SlipeLuaClientGui
System.import(function (out)
  SlipeLuaClientGui = SlipeLua.Client.Gui
end)
System.namespace("SlipeLua.Client.Gui", function (namespace)
  --/ <summary>
  --/ Represents a Cegui radio button
  --/ </summary>
  namespace.class("RadioButton", function (namespace)
    local getSelected, setSelected, __ctor1__, __ctor2__
    __ctor1__ = function (this, element)
      SlipeLuaClientGui.GuiElement.__ctor__(this, element)
    end
    __ctor2__ = function (this, position, dimensions, content, relative, parent)
      local default = parent
      if default ~= nil then
        default = default:getMTAElement()
      end
      __ctor1__(this, SlipeLuaMtaDefinitions.MtaClient.GuiCreateRadioButton(position.X, position.Y, dimensions.X, dimensions.Y, content, relative, default))
    end
    getSelected = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GuiRadioButtonGetSelected(this.element)
    end
    setSelected = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.GuiRadioButtonSetSelected(this.element, value)
    end
    return {
      base = function (out)
        return {
          out.SlipeLua.Client.Gui.GuiElement
        }
      end,
      getSelected = getSelected,
      setSelected = setSelected,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          properties = {
            { "Selected", 0x106, System.Boolean, getSelected, setSelected }
          },
          methods = {
            { ".ctor", 0x106, __ctor1__, out.SlipeLua.MtaDefinitions.MtaElement },
            { ".ctor", 0x506, __ctor2__, System.Numerics.Vector2, System.Numerics.Vector2, System.String, System.Boolean, out.SlipeLua.Client.Gui.GuiElement }
          },
          class = { 0x6, System.new(out.SlipeLua.Shared.Elements.DefaultElementClassAttribute, 2, 20 --[[ElementType.GuiRadioButton]]) }
        }
      end
    }
  end)
end)