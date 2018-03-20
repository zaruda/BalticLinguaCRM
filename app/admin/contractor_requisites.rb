ActiveAdmin.register ContractorRequisite do
  belongs_to :contractor
  permit_params :value, :contractor_id, :requisite_id

  config.create_another = true

end
