﻿namespace GameObjects.Conditions.ConditionKindPack
{
    using GameObjects;
    using GameObjects.Conditions;
    using System;

    internal class ConditionKind2230 : ConditionKind
    {
        private int val = 0;

        public override bool CheckConditionKind(Architecture a)
        {
            return a.Domination >= val;
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

