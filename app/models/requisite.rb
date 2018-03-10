class Requisite < ApplicationRecord
  has_many :customer_requisites
  validates_presence_of :name
end
