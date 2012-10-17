﻿namespace GameObjects.Conditions.ConditionKindPack
{
    using GameObjects;
    using GameObjects.Conditions;
    using System;

    internal class ConditionKind1051 : ConditionKind
    {
        public override bool CheckConditionKind(Troop troop)
        {
            return (troop.Army.FollowedLeader != troop.Leader);
        }
    }
}

