class Customer < ApplicationRecord
  has_many :customer_requisites
  has_many :customer_contacts, dependent: :destroy
end
