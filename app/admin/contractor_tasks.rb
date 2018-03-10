ActiveAdmin.register ContractorTask do
  menu label: 'Подрядчикам', parent: 'Задачи'

  permit_params :status, :tarif, :scope_of_work, :description, :contractor_id, :files

  form do |f|
    f.inputs do
      f.input :contractor_id, as: :select, collection: Contractor.all, label: I18n.t('app.contractor')
      f.input :scope_of_work, label: I18n.t('app.scope_of_work')
      f.input :tarif, label: I18n.t('app.tarif')
      f.input :status, as: :select, collection: ORDER_STATUS, label: I18n.t('app.status')
      f.input :description, as: :text, label: I18n.t('app.description')
      f.input :files, as: :file, label: I18n.t('app.file')
    end
    f.actions
  end

  show do
    panel 'Информация о задаче' do
      attributes_table_for contractor_task do
        row I18n.t('app.status') do
          contractor_task.status
        end
        row I18n.t('app.contractor') do
          contractor_task.contractor
        end
        row I18n.t('app.scope_of_work') do
          contractor_task.scope_of_work
        end
        row I18n.t('app.tarif') do
          contractor_task.tarif
        end
        row I18n.t('app.file') do
          if contractor_task.files.present?
            contractor_task.files.each do |file|
              div link_to(file.filename, rails_blob_path(file, disposition: :attachment))
            end
          else
            status_tag 'Файлов нет'
          end
        end
      end
    end
    active_admin_comments
  end

end
