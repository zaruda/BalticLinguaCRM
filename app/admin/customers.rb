ActiveAdmin.register Customer do
  menu label: 'Заказчики', priority: 2

  permit_params :name, :scope, :category, :type, :status, :unp_ogrn,
                :bill_type, :is_bill_attachment, :application_type,
                :invoice_from, :payment_type, :comment


  show title: :name do

    panel 'Основная информация' do
      attributes_table_for customer, :name, :scope, :category, :type, :status
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
                     admin_customer_customer_contact_path(customer),
                     class: :button)
        end
      end
    end

    panel 'Заказы' do
      table_for customer.orders do
        column('ID') { |order| link_to(order.id, admin_order_path(order)) }
        column :start_date_customer
        column :end_date_customer
        column :priority
        column :scope_of_work
        column :status
        column :price
        column :payment_status
      end
    end
    active_admin_comments
  end

  sidebar 'Банковские реквизиты', only: :show do
    table_for(customer.customer_requisites) do
      column('Реквизит', &:requisite)
      column('Значение', &:value)
    end
    div class: 'action_items' do
      link_to('Добавить реквизит',
              new_admin_customer_customer_requisite_path(customer),
              class: :button)
    end
  end
end
