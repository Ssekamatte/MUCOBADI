﻿using System;
using System.Collections.Generic;

#nullable disable

namespace MUCOBADI.Models
{
    public partial class ARegion
    {
        public ARegion()
        {
            ADistrict = new HashSet<ADistrict>();
        }

        public int RegionId { get; set; }
        public string RegionDescription { get; set; }

        public virtual ICollection<ADistrict> ADistrict { get; set; }
    }
}
