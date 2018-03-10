class Order < ApplicationRecord
  has_and_belongs_to_many :contractors
  has_many :payments, dependent: :destroy
  belongs_to :customer
  has_many_attached :uploads

  default_scope { order(created_at: :desc) }

  scope :done, -> { where(status: 'Выполнен') }
  scope :current, -> { where(status: 'В работе') }

  validates_presence_of :contractors
end
