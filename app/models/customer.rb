class Customer < ApplicationRecord
  has_many :customer_requisites, dependent: :destroy
  has_many :customer_contacts, dependent: :destroy
  has_many :orders, dependent: :nullify

  default_scope { order(created_at: :desc) }

  scope :active, -> { where(status: 'Active') }
  scope :inactive, -> { where(status: 'Inactive') }
end
