class Requisite < ApplicationRecord
  has_many :customer_requisites
  has_many :contractor_requisites
  validates_presence_of :name
end
