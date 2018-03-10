ActiveAdmin.register ContractorService do
  belongs_to :contractor

  permit_params :language_from, :language_to, :contractor_id, :service_id

  form do |f|
    f.inputs do
      f.input :service_id, as: :select, collection: Service.all, label: I18n.t('app.service')
      f.input :language_from, label: I18n.t('app.language_from')
      f.input :language_to, label: I18n.t('app.language_to')
    end
    f.actions
  end

end
