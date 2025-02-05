using Pims.Api.Models.Base;
using Pims.Api.Models.Concepts.Organization;
using Pims.Api.Models.Concepts.Person;

namespace Pims.Api.Models.Concepts.Property
{
    /// <summary>
    /// PropertyContactModel class, provides a model to represent the property contacts.
    /// </summary>
    public class PropertyContactModel : BaseAuditModel
    {
        #region Properties

        public long Id { get; set; }

        public long PropertyId { get; set; }

        public long? OrganizationId { get; set; }

        public OrganizationModel Organization { get; set; }

        public long? PersonId { get; set; }

        public PersonModel Person { get; set; }

        public long? PrimaryContactId { get; set; }

        public PersonModel PrimaryContact { get; set; }

        public string Purpose { get; set; }

        #endregion
    }
}
