﻿namespace GameObjects.Influences.InfluenceKindPack
{
    using GameObjects;
    using GameObjects.Influences;
    using System;

    internal class InfluenceKind5090 : InfluenceKind
    {
        private int chance = 0;

        public override void ApplyInfluenceKind(Person person)
        {
            if (person.LocationTroop != null)
            {
                person.LocationTroop.ChanceOfBlockArrowAttack += this.chance;
            }
        }

        public override void InitializeParameter(string parameter)
        {
            try
            {
                this.chance = int.Parse(parameter);
            }
            catch
            {
            }
        }

        public override void PurifyInfluenceKind(Person person)
        {
            if (person.LocationTroop != null)
            {
                person.LocationTroop.ChanceOfBlockArrowAttack -= this.chance;
            }
        }
    }
}

