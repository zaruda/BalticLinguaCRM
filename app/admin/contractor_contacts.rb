ActiveAdmin.register ContractorContact do
  belongs_to :contractor

  permit_params :phone, :email

end
