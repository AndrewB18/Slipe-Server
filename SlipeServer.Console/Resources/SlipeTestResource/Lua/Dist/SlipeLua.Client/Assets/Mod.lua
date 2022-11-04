-- Generated by CSharp.lua Compiler
local System = System
local ListTuple = System.List(System.Tuple)
local SlipeLuaClientAssets
System.import(function (out)
  SlipeLuaClientAssets = SlipeLua.Client.Assets
end)
System.namespace("SlipeLua.Client.Assets", function (namespace)
  --/ <summary>
  --/ A single mod, consisting of a .txd and optionally a .dff and .col
  --/ </summary>
  namespace.class("Mod", function (namespace)
    local ApplyTo, OnFileDownload, ApplyFiles, Restore, addOnDownloadComplete, removeOnDownloadComplete, __ctor1__, __ctor2__
    __ctor1__ = function (this, txd, dff, col)
      this.txd = txd
      this.dff = dff
      this.col = col
      this.state = 0 --[[DownloadState.Default]]
      this.modelsToApply = ListTuple()
    end
    __ctor2__ = function (this, txdFilepath, dffFilepath, colFilepath)
      if txdFilepath ~= nil then
        this.txd = SlipeLuaClientAssets.Txd(txdFilepath)
      end
      if dffFilepath ~= nil then
        this.dff = SlipeLuaClientAssets.Dff(dffFilepath)
      end
      if colFilepath ~= nil then
        this.col = SlipeLuaClientAssets.Col(colFilepath)
      end
      this.state = 0 --[[DownloadState.Default]]
      this.modelsToApply = ListTuple()
    end
    ApplyTo = function (this, model, supportsAlpha)
      if this.state == 2 --[[DownloadState.Downloaded]] then
        ApplyFiles(this, model, supportsAlpha)
        return
      elseif this.state == 1 --[[DownloadState.Downloading]] then
        this.modelsToApply:Add(System.Tuple(model, supportsAlpha))
        return
      end

      this.state = 1 --[[DownloadState.Downloading]]
      this.modelsToApply:Add(System.Tuple(model, supportsAlpha))

      if this.txd ~= nil then
        this.txd:addOnDownloadComplete(System.fn(this, OnFileDownload))
        this.txd:Download()
      end

      if this.dff ~= nil then
        this.dff:addOnDownloadComplete(System.fn(this, OnFileDownload))
        this.dff:Download()
      end

      if this.col ~= nil then
        this.col:addOnDownloadComplete(System.fn(this, OnFileDownload))
        this.col:Download()
      end
    end
    OnFileDownload = function (this)
      if this.txd ~= nil and this.txd:getState() ~= 2 --[[DownloadState.Downloaded]] or this.dff ~= nil and this.dff:getState() ~= 2 --[[DownloadState.Downloaded]] or this.col ~= nil and this.col:getState() ~= 2 --[[DownloadState.Downloaded]] then
        return
      end
      this.state = 2 --[[DownloadState.Downloaded]]
      local default = this.OnDownloadComplete
      if default ~= nil then
        default()
      end
      ApplyFiles(this, -1, false)
    end
    ApplyFiles = function (this, model, supportsAlpha)
      if model == - 1 then
        for _, mod in System.each(this.modelsToApply) do
          ApplyFiles(this, mod[1], supportsAlpha or mod[2])
        end
        return
      end
      if this.txd ~= nil then
        this.txd:Load(true)
        this.txd:ApplyTo(model)
      end
      if this.dff ~= nil then
        this.dff:Load()
        this.dff:ApplyTo(model, supportsAlpha)
      end

      if this.col ~= nil then
        this.col:Load()
        this.col:ApplyTo(model)
      end
    end
    Restore = function (this, model)
      if this.dff ~= nil then
        SlipeLuaClientAssets.Dff.Restore(model)
      end
      if this.col ~= nil then
        SlipeLuaClientAssets.Col.Restore(model)
      end
    end
    addOnDownloadComplete, removeOnDownloadComplete = System.event("OnDownloadComplete")
    return {
      state = 0,
      ApplyTo = ApplyTo,
      Restore = Restore,
      addOnDownloadComplete = addOnDownloadComplete,
      removeOnDownloadComplete = removeOnDownloadComplete,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          fields = {
            { "col", 0x1, out.SlipeLua.Client.Assets.Col },
            { "dff", 0x1, out.SlipeLua.Client.Assets.Dff },
            { "modelsToApply", 0x1, System.List(System.Tuple) },
            { "state", 0x1, System.Int32 },
            { "txd", 0x1, out.SlipeLua.Client.Assets.Txd }
          },
          methods = {
            { ".ctor", 0x306, __ctor1__, out.SlipeLua.Client.Assets.Txd, out.SlipeLua.Client.Assets.Dff, out.SlipeLua.Client.Assets.Col },
            { ".ctor", 0x306, __ctor2__, System.String, System.String, System.String },
            { "ApplyFiles", 0x201, ApplyFiles, System.Int32, System.Boolean },
            { "ApplyTo", 0x206, ApplyTo, System.Int32, System.Boolean },
            { "OnFileDownload", 0x1, OnFileDownload },
            { "Restore", 0x106, Restore, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)