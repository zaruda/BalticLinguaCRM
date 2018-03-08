ActiveAdmin.register Order do
  menu label: 'Заказы', priority: 4

  permit_params :status, :payment_status, :start_date_contractor, :end_date_contractor,
                :start_date_customer, :end_date_customer, :priority, :price, :description,
                :scope_of_work, :customer_id,:uploads, contractor_ids: []
  form do |f|
    f.inputs multipart: :true do
      f.input :customer
      f.input :contractors
      f.input :status
      f.input :payment_status
      f.input :start_date_contractor, as: :datetime_picker
      f.input :end_date_contractor, as: :datetime_picker
      f.input :start_date_customer, as: :datetime_picker
      f.input :end_date_customer, as: :datetime_picker
      f.input :priority, input_html: { min: '0', max: '10' }
      f.input :price
      f.input :description
      f.input :scope_of_work
      f.input :uploads, as: :file
    end
    f.actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
