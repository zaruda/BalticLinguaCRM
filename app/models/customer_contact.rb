class CustomerContact < ApplicationRecord
  belongs_to :customer

  validates :region, :address, :phone, :email, presence: true
  validates_format_of :email, with: Devise.email_regexp

end
