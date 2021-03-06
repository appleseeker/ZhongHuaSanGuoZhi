﻿namespace GameObjects.Influences.InfluenceKindPack
{
    using GameObjects;
    using GameObjects.Influences;
    using System;

    internal class InfluenceKind6790 : InfluenceKind
    {
        private int rate;

        public override void ApplyInfluenceKind(Troop troop)
        {
            troop.GlamourExperienceIncrease += rate;
        }

        public override void PurifyInfluenceKind(Troop troop)
        {
            troop.GlamourExperienceIncrease -= rate;
        }

        public override void InitializeParameter(string parameter)
        {
            try
            {
                this.rate = int.Parse(parameter);
            }
            catch
            {
            }
        }
    }
}

