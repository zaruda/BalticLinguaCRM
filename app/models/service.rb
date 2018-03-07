class Service < ApplicationRecord
  has_many :contractor_services, dependent: :destroy
end
