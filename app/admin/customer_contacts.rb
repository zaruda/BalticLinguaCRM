ActiveAdmin.register CustomerContact do
  belongs_to :customer
  permit_params :region, :address, :phone, :fax, :email, :website

  form do |f|
    f.inputs do
      f.input :region, label: I18n.t('app.region')
      f.input :address, label: I18n.t('app.address')
      f.input :phone, label: I18n.t('app.phone')
      f.input :fax, label: I18n.t('app.fax')
      f.input :email, label: I18n.t('app.email')
      f.input :website, label: I18n.t('app.website')
    end
    f.actions
  end

end
