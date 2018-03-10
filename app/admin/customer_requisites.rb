ActiveAdmin.register CustomerRequisite do
  belongs_to :customer
  permit_params :value, :customer_id, :requisite_id

  config.create_another = true

end
