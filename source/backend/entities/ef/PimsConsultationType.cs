﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Pims.Dal.Entities
{
    [Table("PIMS_CONSULTATION_TYPE")]
    [Index(nameof(ConsultationStatusTypeCode), Name = "CONTYP_CONSULTATION_STATUS_TYPE_CODE_IDX")]
    public partial class PimsConsultationType
    {
        public PimsConsultationType()
        {
            PimsLeaseConsultations = new HashSet<PimsLeaseConsultation>();
        }

        [Key]
        [Column("CONSULTATION_TYPE_CODE")]
        [StringLength(20)]
        public string ConsultationTypeCode { get; set; }
        [Required]
        [Column("CONSULTATION_STATUS_TYPE_CODE")]
        [StringLength(20)]
        public string ConsultationStatusTypeCode { get; set; }
        [Required]
        [Column("DESCRIPTION")]
        [StringLength(200)]
        public string Description { get; set; }
        [Column("OTHER_DESCRIPTION")]
        [StringLength(200)]
        public string OtherDescription { get; set; }
        [Column("DISPLAY_ORDER")]
        public int? DisplayOrder { get; set; }
        [Required]
        [Column("IS_DISABLED")]
        public bool? IsDisabled { get; set; }
        [Column("CONCURRENCY_CONTROL_NUMBER")]
        public long ConcurrencyControlNumber { get; set; }
        [Column("DB_CREATE_TIMESTAMP", TypeName = "datetime")]
        public DateTime DbCreateTimestamp { get; set; }
        [Required]
        [Column("DB_CREATE_USERID")]
        [StringLength(30)]
        public string DbCreateUserid { get; set; }
        [Column("DB_LAST_UPDATE_TIMESTAMP", TypeName = "datetime")]
        public DateTime DbLastUpdateTimestamp { get; set; }
        [Required]
        [Column("DB_LAST_UPDATE_USERID")]
        [StringLength(30)]
        public string DbLastUpdateUserid { get; set; }

        [ForeignKey(nameof(ConsultationStatusTypeCode))]
        [InverseProperty(nameof(PimsConsultationStatusType.PimsConsultationTypes))]
        public virtual PimsConsultationStatusType ConsultationStatusTypeCodeNavigation { get; set; }
        [InverseProperty(nameof(PimsLeaseConsultation.ConsultationTypeCodeNavigation))]
        public virtual ICollection<PimsLeaseConsultation> PimsLeaseConsultations { get; set; }
    }
}