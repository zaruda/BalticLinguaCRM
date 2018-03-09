ActiveAdmin.register EditorTask do
  menu label: 'Редакторам', parent: 'Задачи'

  permit_params :status, :tarif, :description, :admin_user_id, :files


  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :select , collection: AdminUser.all.map(&:name)
      f.input :status, label: I18n.t('app.status')
      f.input :tarif, label: I18n.t('app.tarif')
      f.input :description, label: I18n.t('app.description')
      f.input :files, as: :file, label: I18n.t('app.file')
    end
    f.actions
  end

  show do
    panel 'Информация о задаче' do
      attributes_tabel_for editor_task do
        row I18n.t('app.redactor') do
          editor_task.admin_user
        end
        row I18n.t('app.tarif') do
          editor_task.tarif
        end
        row I18n.t('app.file') do
          if editor_task.files.attached? do
            editor_task.files.each do |file|
              div link_to(file.filename, rails_blob_path(file, disposition: :attachment))
            end
          else
              status_tag 'Файлов нет'
            end
          end
        end

        row I18n.t('app.description') do
          editor_task.description
        end
      end
    end
    active_admin_comments
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
