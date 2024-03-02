namespace DoAnWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    public partial class tb_Post
    {
        public int Id { get; set; }
        [Required]
        [StringLength(250)]
        public string Title { get; set; }

        public int CategoryId { get; set; }

        [StringLength(4000)]
        public string Description { get; set; }
        [AllowHtml]
        public string Detail { get; set; }

        [StringLength(50)]
        public string Image { get; set; }

        [StringLength(250)]
        public string SeoTitle { get; set; }

        [StringLength(550)]
        public string SeoDescription { get; set; }

        [StringLength(250)]
        public string SeoKeywords { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(150)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(150)]
        public string ModifierBy { get; set; }

        public bool IsActive { get; set; }
    }
}
