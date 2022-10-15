-- Generated by CSharp.lua Compiler
local System = System
local SlipeLuaMtaDefinitions = SlipeLua.MtaDefinitions
local SlipeLuaClientGui
System.import(function (out)
  SlipeLuaClientGui = SlipeLua.Client.Gui
end)
System.namespace("SlipeLua.Client.Gui", function (namespace)
  --/ <summary>
  --/ A Cegui single line text field
  --/ </summary>
  namespace.class("Edit", function (namespace)
    local getCaretIndex, setCaretIndex, getMaxLength, setMaxLength, getMasked, setMasked, getReadOnly, setReadOnly, 
    addOnAccepted, removeOnAccepted, __ctor1__, __ctor2__
    __ctor1__ = function (this, element)
      SlipeLuaClientGui.EditableGuiElement.__ctor__(this, element)
    end
    __ctor2__ = function (this, position, dimensions, defaultContent, relative, parent, masked, maxLength)
      local default = parent
      if default ~= nil then
        default = default:getMTAElement()
      end
      __ctor1__(this, SlipeLuaMtaDefinitions.MtaClient.GuiCreateEdit(position.X, position.Y, dimensions.X, dimensions.Y, defaultContent, relative, default))
      setMasked(this, masked)
      setMaxLength(this, maxLength)
    end
    getCaretIndex = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GuiEditGetCaretIndex(this.element)
    end
    setCaretIndex = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.GuiEditSetCaretIndex(this.element, value)
    end
    getMaxLength = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GuiEditGetMaxLength(this.element)
    end
    setMaxLength = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.GuiEditSetMaxLength(this.element, value)
    end
    getMasked = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GuiEditIsMasked(this.element)
    end
    setMasked = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.GuiEditSetMasked(this.element, value)
    end
    getReadOnly = function (this)
      return SlipeLuaMtaDefinitions.MtaClient.GuiEditIsReadOnly(this.element)
    end
    setReadOnly = function (this, value)
      SlipeLuaMtaDefinitions.MtaClient.GuiEditSetReadOnly(this.element, value)
    end
    addOnAccepted, removeOnAccepted = System.event("OnAccepted")
    return {
      base = function (out)
        return {
          out.SlipeLua.Client.Gui.EditableGuiElement
        }
      end,
      getCaretIndex = getCaretIndex,
      setCaretIndex = setCaretIndex,
      getMaxLength = getMaxLength,
      setMaxLength = setMaxLength,
      getMasked = getMasked,
      setMasked = setMasked,
      getReadOnly = getReadOnly,
      setReadOnly = setReadOnly,
      addOnAccepted = addOnAccepted,
      removeOnAccepted = removeOnAccepted,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          properties = {
            { "CaretIndex", 0x106, System.Int32, getCaretIndex, setCaretIndex },
            { "Masked", 0x106, System.Boolean, getMasked, setMasked },
            { "MaxLength", 0x106, System.Int32, getMaxLength, setMaxLength },
            { "ReadOnly", 0x106, System.Boolean, getReadOnly, setReadOnly }
          },
          methods = {
            { ".ctor", 0x106, __ctor1__, out.SlipeLua.MtaDefinitions.MtaElement },
            { ".ctor", 0x706, __ctor2__, System.Numerics.Vector2, System.Numerics.Vector2, System.String, System.Boolean, out.SlipeLua.Client.Gui.GuiElement, System.Boolean, System.Int32 }
          },
          class = { 0x6, System.new(out.SlipeLua.Shared.Elements.DefaultElementClassAttribute, 2, 16 --[[ElementType.GuiEdit]]) }
        }
      end
    }
  end)
end)
