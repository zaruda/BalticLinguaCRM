class Contractor < ApplicationRecord
  has_and_belongs_to_many :orders
  has_many :payments
  has_many :contractor_contacts, dependent: :destroy
  has_many :contractor_services, dependent: :destroy
end
