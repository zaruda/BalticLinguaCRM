ActiveAdmin.register EditorTask do
  menu label: 'Редакторам', parent: 'Задачи'

  permit_params :status, :tarif, :description, :admin_user_id


  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :select , collection: AdminUser.all.map(&:name)
      f.input :status
      f.input :tarif
      f.input :description
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
