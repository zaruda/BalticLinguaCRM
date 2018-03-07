ActiveAdmin.register Customer do

  permit_params :name, :scope, :category, :type, :status, :unp_ogrn,
                :bill_type, :is_bill_attachment, :application_type,
                :invoice_from, :payment_type, :comment


  show title: :name do
    # panel "Order History" do
      # table_for(user.orders) do
      #   column("Order", sortable: :id) do |order|
      #     link_to "##{order.id}", admin_order_path(order)
      #   end
      #   column("State") { |order| status_tag(order.state) }
      #   column("Date", sortable: :checked_out_at) do |order|
      #     pretty_format(order.checked_out_at)
      #   end
      #   column("Total") { |order| number_to_currency order.total_price }
      # end
    panel "Основная информация" do
      table_for customer do
        column :name
        column :category
        column :status
      end
    end

    panel "Контакты" do
      table_for(customer.customer_contacts) do
        column :region
        column :address
        column :phone
        column :fax
        column :email
        column :website
        tr class: "action_items" do
          td link_to("New address",
                     new_admin_customer_customer_contact_path(customer),
                     class: :button)
          td link_to("Manage adress",
                     admin_customer_customer_contacts_path(customer),
                     class: :button)
        end
      end
    end

    panel "Req" do
        tr class: "action_items" do
          td link_to("New Req",
                     new_admin_customer_customer_requisite_path(customer),
                     class: :button)
        end
    end
    active_admin_comments

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
