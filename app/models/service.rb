class Service < ApplicationRecord
  has_many :contractor_services, dependent: :destroy
  validates_presence_of :name
end
