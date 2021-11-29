class Tenant < ApplicationRecord
  has_many :apartments
  has_many :leases

  # Validations
  validates :name, presence: true
  validates :age, inclusion: {in: 18..}
end
