class CustomerRequisite < ApplicationRecord
  belongs_to :customer
  has_many :requisites
end
