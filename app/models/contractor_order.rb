class ContractorOrder < ApplicationRecord
  belongs_to :order
  belongs_to :contractor
end
