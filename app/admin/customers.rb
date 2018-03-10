ActiveAdmin.register Customer do
  menu label: 'Заказчики', priority: 2

  permit_params :name, :scope, :category, :kind, :status, :unp_ogrn,
                :bill_type, :is_bill_attachment, :application_type,
                :invoice_from, :payment_type, :comment

  scope :all
  scope :active
  scope :inactive

  form do |f|
    f.inputs do
      f.input :name, label: I18n.t('app.name')
      f.input :scope, label: I18n.t('app.scope')
      f.input :category, label: I18n.t('app.category')
      f.input :kind, label: I18n.t('app.type')
      f.input :unp_ogrn, label: I18n.t('app.unp_ogrn')
      f.input :bill_type, as: :select, collection: BILL_TYPES, label: I18n.t('app.bill_type')
      f.input :is_bill_attachment, label: I18n.t('app.is_bill_attachment')
      f.input :application_type,
              as: :select,
              collection: APPLICATION_TYPES,
              label: I18n.t('app.application_type')
      f.input :invoice_from,
              as: :select,
              collection: INVOICES_FROM,
              label: I18n.t('app.invoices_from')
      f.input :payment_type,
              as: :select,
              collection: PAYMENT_TYPES,
              label: I18n.t('app.payment_type')
      f.input :status, as: :select, collection: STATUS, label: I18n.t('app.status')
      f.input :comment, label: I18n.t('app.comment')
      # order.uploads.each do |file|
      # link_to(file.filename, '#', onclick: ApplicationHelper::delete_attachment(file))
      # end
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column(I18n.t('app.name'), :name)
    column(I18n.t('app.scope'), :scope)
    column(I18n.t('app.category'), :category)
    column(I18n.t('app.type'), :kind)
    column(I18n.t('app.status'), :status)
    actions
  end

  show title: :name do

    panel 'Основная информация' do
      attributes_table_for customer, :name, :scope, :category, :kind, :status
    end

    panel 'Контакты' do
      table_for(customer.customer_contacts) do
        column('Регион', :region)
        column('Адрес', :address)
        column('Телефон', :phone)
        column('Факс', :fax)
        column('E-mail', :email)
        column('Веб-сайт', :website)
        tr class: 'action_items' do
          td link_to('New address',
                     new_admin_customer_customer_contact_path(customer),
                     class: :button)
          td link_to('Manage adress',
                     admin_customer_customer_contacts_path(customer),
                     class: :button)
        end
      end
    end

    panel 'Заказы' do
      table_for customer.orders do
        column('ID') { |order| link_to(order.id, admin_order_path(order)) }
        column(I18n.t('app.start_date_customer'), :start_date_customer)
        column(I18n.t('app.end_date_customer'), :end_date_customer)
        column(I18n.t('app.priority'), :priority)
        column(I18n.t('app.scope_of_work'), :scope_of_work)
        column(I18n.t('app.status'), :status)
        column(I18n.t('app.price'), :price)
        column(I18n.t('app.payment_status'), :payment_status)
      end
    end
    active_admin_comments
  end

  sidebar 'Банковские реквизиты', only: :show do
    table_for(customer.customer_requisites) do
      column('Реквизит', &:requisite)
      column &:value
    end
    div class: 'action_items' do
      if customer.customer_requisites.present?
        div link_to('Добавить реквизит',
                    new_admin_customer_customer_requisite_path(customer),
                    class: :button)
        div link_to('Редактировать',
                    admin_customer_customer_requisites_path(customer),
                    class: :button)
      else
        link_to('Добавить реквизит',
                new_admin_customer_customer_requisite_path(customer),
                class: :button)
      end

    end
  end
end
