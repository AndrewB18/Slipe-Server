﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlipeServer.Packets.Enums
{
    public enum PlayerDisconnectType
    {
        NO_REASON,
        INVALID_PASSWORD,
        INVALID_NICKNAME,
        BANNED_SERIAL,
        BANNED_IP,
        BANNED_ACCOUNT,
        VERSION_MISMATCH,
        JOIN_FLOOD,
        INCORRECT_PASSWORD,
        DIFFERENT_BRANCH,
        BAD_VERSION,
        SERVER_NEWER,
        SERVER_OLDER,
        NICK_CLASH,
        ELEMENT_FAILURE,
        GENERAL_REFUSED,
        SERIAL_VERIFICATION,
        CONNECTION_DESYNC,
        BAN,
        KICK,
        CUSTOM,
        SHUTDOWN
    };
}