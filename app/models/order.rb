class Order < ApplicationRecord
  has_and_belongs_to_many :contractors
  has_many :payments, dependent: :destroy
  has_many_attached :uploads
  belongs_to :customer

  default_scope { order(created_at: :desc) }

end
