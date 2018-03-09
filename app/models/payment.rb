class Payment < ApplicationRecord
  has_many_attached :attachments
  belongs_to :order
  belongs_to :contractor
end
