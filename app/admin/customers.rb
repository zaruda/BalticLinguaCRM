ActiveAdmin.register Customer do
  menu label: 'Заказчики', priority: 2

  permit_params :name, :scope, :category, :type, :status, :unp_ogrn,
                :bill_type, :is_bill_attachment, :application_type,
                :invoice_from, :payment_type, :comment


  show title: :name do
    # panel "Main info" do
    #   table_for(user.orders) do
    #     column("Order", sortable: :id) do |order|
    #       link_to "##{order.id}", admin_order_path(order)
    #     end
    #     column("State") { |order| status_tag(order.state) }
    #     column("Date", sortable: :checked_out_at) do |order|
    #       pretty_format(order.checked_out_at)
    #     end
    #     column("Total") { |order| number_to_currency order.total_price }
    #   end
    panel 'Основная информация' do
      attributes_table_for customer, :name, :scope, :category, :type, :status
    end

    panel 'Контакты' do
      table_for(customer.customer_contacts) do
        column('Регион', :region)
        column('Адрес' ,:address)
        column('Телефон' ,:phone)
        column('Факс' ,:fax)
        column('E-mail' ,:email)
        column('Веб-сайт' ,:website)
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
