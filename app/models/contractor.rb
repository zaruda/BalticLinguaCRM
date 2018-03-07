class Contractor < ApplicationRecord
  has_many :contractor_contacts, dependent: :destroy
  has_many :contractor_services, dependent: :destroy
end
