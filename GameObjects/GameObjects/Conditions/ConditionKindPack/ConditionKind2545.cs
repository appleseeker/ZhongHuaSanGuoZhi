﻿namespace GameObjects.Conditions.ConditionKindPack
{
    using GameObjects;
    using GameObjects.Conditions;
    using System;

    internal class ConditionKind2545 : ConditionKind
    {
        private int val;
        private int type;

        public override bool CheckConditionKind(Architecture a)
        {
            int result = 0;
            foreach (Military m in a.Militaries)
            {
                if (m.KindID == type)
                {
                    result++;
                }
            }
            return result < val;
        }

        public override bool CheckConditionKind(Faction faction)
        {
            int result = 0;
            foreach (Military m in faction.Militaries)
            {
                if (m.KindID == type)
                {
                    result++;
                }
            }
            return result < val;
        }

        public override void InitializeParameter(string parameter)
        {
            try
            {
                this.val = int.Parse(parameter);
            }
            catch
            {
            }
        }

    }
}

