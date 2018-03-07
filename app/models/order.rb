class Order < ApplicationRecord
  has_and_belongs_to_many :contractors
  belongs_to :customer
end
