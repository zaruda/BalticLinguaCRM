class CustomerRequisite < ApplicationRecord
  belongs_to :customer
  belongs_to :requisite
end
