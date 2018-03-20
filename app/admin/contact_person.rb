ActiveAdmin.register ContactPerson do
  belongs_to :customer

  permit_params :name, :phone, :email, :position, :description

end
