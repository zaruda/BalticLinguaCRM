class Customer < ApplicationRecord
  has_many :customer_requisites, dependent: :destroy
  has_many :customer_contacts, dependent: :destroy
end
