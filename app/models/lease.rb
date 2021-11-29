class Lease < ApplicationRecord
  belongs_to :apartment
  belongs_to :tenant

  # Validations
  validates :apartment_id, :tenant_id, presence: true, acceptance: {message: "testing message"}
end
