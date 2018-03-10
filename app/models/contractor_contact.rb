class ContractorContact < ApplicationRecord
  belongs_to :contractor

  validates_format_of :email, with: Devise.email_regexp
end
