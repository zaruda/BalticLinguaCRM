class Contractor < ApplicationRecord
  has_and_belongs_to_many :orders
  has_many :payments, dependent: :nullify
  has_many :contractor_tasks, dependent: :destroy
  has_many :contractor_contacts, dependent: :destroy
  has_many :contractor_services, dependent: :destroy
  has_many :contractor_skills, dependent: :destroy
  has_many :contractor_requisites, dependent: :destroy

  scope :active, -> { where(status: 'Active') }
  scope :inactive, -> { where(status: 'Inactive') }

  validates_presence_of :name
end
