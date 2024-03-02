namespace DoAnWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tb_Recruitment
    {
        public int Id { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        [StringLength(250)]
        public string PhoneNumber { get; set; }

        [StringLength(250)]
        public string CCCDorCMND { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [StringLength(250)]
        public string ImageDriver { get; set; }

        public int? IsRead { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}
