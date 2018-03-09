class ContractorTask < ApplicationRecord
  belongs_to :contractor
  has_many_attached :files
end
