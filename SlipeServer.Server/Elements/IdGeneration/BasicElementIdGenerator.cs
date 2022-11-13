﻿using SlipeServer.Server.Constants;

namespace SlipeServer.Server.Elements.IdGeneration;

public class BasicElementIdGenerator : IElementIdGenerator
{
    private uint idCounter;
    private readonly object idLock = new();

    public BasicElementIdGenerator()
    {
        this.idCounter = 1;
    }

    public uint GetId()
    {
        lock (this.idLock)
        {
            this.idCounter = (this.idCounter + 1) % ElementConstants.MaxElementId;
            if (this.idCounter == 0)
                this.idCounter++;
            return this.idCounter;
        }
    }
}
