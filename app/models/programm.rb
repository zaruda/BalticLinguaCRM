class Programm < ApplicationRecord
  has_many :contractor_skills, dependent: :destroy
end
