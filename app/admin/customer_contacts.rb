ActiveAdmin.register CustomerContact do
  belongs_to :customer
  permit_params :region, :address, :phone, :fax, :email, :website

  # show do
  #
  #   form do |f|
  #     f.inputs do
  #       f.input :region
  #       f.input :address
  #       f.input :phone
  #       f.input :fax
  #       f.input :email
  #       f.input :website
  #     end
  #     f.actions
  #   end
  # end


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
