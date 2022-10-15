-- Generated by CSharp.lua Compiler
local System = System
local SlipeLuaMtaDefinitions = SlipeLua.MtaDefinitions
local SlipeLuaClientGui
System.import(function (out)
  SlipeLuaClientGui = SlipeLua.Client.Gui
end)
System.namespace("SlipeLua.Client.Gui", function (namespace)
  --/ <summary>
  --/ Represents a Cegui scroll pane
  --/ </summary>
  namespace.class("ScrollPane", function (namespace)
    local getHorizontalScrollPosition, setHorizontalScrollPosition, getVerticalScrollPosition, setVerticalScrollPosition, UseScrollBars, __ctor1__, __ctor2__
    __ctor1__ = function (this, element)
      SlipeLuaClientGui.GuiElement.__ctor__(this, element)
    end
    __ctor2__ = function (this, position, dimensions, relative, parent)
      local default = parent
      if default ~= nil then
        default = default:getMTAElement()
      end
      __ctor1__(this, SlipeLuaMtaDefinitions.MtaClient.GuiCreateScrollPane(position.X, position.Y, dimensions.X, dimensions.Y, relative, default))
    end
    getHorizontalScrollPosition = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GuiScrollPaneGetHorizontalScrollPosition(this.element)
    end
    setHorizontalScrollPosition = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.GuiScrollPaneSetHorizontalScrollPosition(this.element, value)
    end
    getVerticalScrollPosition = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GuiScrollPaneGetVerticalScrollPosition(this.element)
    end
    setVerticalScrollPosition = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.GuiScrollPaneSetVerticalScrollPosition(this.element, value)
    end
    UseScrollBars = function (this, horizontal, vertical)
      return SlipeLuaMtaDefinitions.MtaClient.GuiScrollPaneSetScrollBars(this.element, horizontal, vertical)
    end
    return {
      base = function (out)
        return {
          out.SlipeLua.Client.Gui.GuiElement
        }
      end,
      getHorizontalScrollPosition = getHorizontalScrollPosition,
      setHorizontalScrollPosition = setHorizontalScrollPosition,
      getVerticalScrollPosition = getVerticalScrollPosition,
      setVerticalScrollPosition = setVerticalScrollPosition,
      UseScrollBars = UseScrollBars,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          properties = {
            { "HorizontalScrollPosition", 0x106, System.Single, getHorizontalScrollPosition, setHorizontalScrollPosition },
            { "VerticalScrollPosition", 0x106, System.Single, getVerticalScrollPosition, setVerticalScrollPosition }
          },
          methods = {
            { ".ctor", 0x106, __ctor1__, out.SlipeLua.MtaDefinitions.MtaElement },
            { ".ctor", 0x406, __ctor2__, System.Numerics.Vector2, System.Numerics.Vector2, System.Boolean, out.SlipeLua.Client.Gui.GuiElement },
            { "UseScrollBars", 0x286, UseScrollBars, System.Boolean, System.Boolean, System.Boolean }
          },
          class = { 0x6, System.new(out.SlipeLua.Shared.Elements.DefaultElementClassAttribute, 2, 22 --[[ElementType.GuiScrollPane]]) }
        }
      end
    }
  end)
end)
