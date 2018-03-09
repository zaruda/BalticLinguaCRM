class EditorTask < ApplicationRecord
  belongs_to :admin_user
  has_many_attached :files
end
