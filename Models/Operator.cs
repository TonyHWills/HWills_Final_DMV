﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace HWills_Final_DMV.Models
{
    public partial class Operator
    {
        public Operator()
        {
            Cars = new HashSet<Car>();
            InfractLinks = new HashSet<InfractLink>();
        }

        public string OperatorId { get; set; }
        public string OperatorFirstName { get; set; }
        public string OperatorLastName { get; set; }
        public string OperatorSocial { get; set; }

        public virtual ICollection<Car> Cars { get; set; }
        public virtual ICollection<InfractLink> InfractLinks { get; set; }
    }
}