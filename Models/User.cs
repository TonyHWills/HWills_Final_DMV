﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace HWills_Final_DMV.Models
{
    public partial class User
    {
        public User()
        {
            InfractLinks = new HashSet<InfractLink>();
        }

        public string UserId { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public string UserEmployer { get; set; }
        public string UserName { get; set; }
        public string UserPassword { get; set; }

        public virtual ICollection<InfractLink> InfractLinks { get; set; }
    }
}