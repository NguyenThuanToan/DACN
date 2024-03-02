namespace DoAnWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tb_Order
    {
        public int Id { get; set; }

        [StringLength(250)]
        public string SenderName { get; set; }

        [StringLength(250)]
        public string SenderPhone { get; set; }

        [StringLength(250)]
        public string SenderAddress { get; set; }

        [StringLength(250)]
        public string ReceiverName { get; set; }

        [StringLength(250)]
        public string ReceiverPhone { get; set; }

        [StringLength(250)]
        public string ReceiverAddress { get; set; }

        [StringLength(250)]
        public string ItemCode { get; set; }

        [StringLength(250)]
        public string ItemName { get; set; }

        public int? ItemQuantity { get; set; }

        public decimal? ItemWeight { get; set; }

        public decimal? ItemValue { get; set; }

        public decimal? Length { get; set; }

        public decimal? Width { get; set; }

        public decimal? Height { get; set; }

        public decimal? PaymentMethodCod { get; set; }
        public decimal? PaymentMethods { get; set; }
        public decimal? PaymentMethodsPrice { get; set; }


        [StringLength(250)]
        public string Payer { get; set; }

        [StringLength(250)]
        public string PickUpRequest { get; set; }

        public string Note { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(250)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(250)]
        public string ModifierBy { get; set; }

        [StringLength(250)]
        public string IsActive { get; set; }

        public string DriverId { get; set; }

        [StringLength(250)]
        public string Title { get; set; }
        public int w_id { get; set; }
        public virtual string create_by_user { get; set; }
    }
}
