ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc{ I18n.t('active_admin.dashboard') } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    #
    #
    columns do
      column do
        panel 'Последние заказы' do
          table_for Order.limit(10) do
            column('ID') { |order| link_to(order.id, admin_order_path(order)) }
            column('Заказчик') { |order| link_to(order.customer.name, admin_customer_path(order.customer)) }
            column('Сумма') { |order| number_to_currency order.price }
            column('Статус выполнения') { |order| status_tag(order.status) }
            column('Uploads') {|order| link_to(order.uploads[0].filename, rails_blob_path(order.uploads[0], disposition: :attachment))}
          end
        end
      end

      column do
        panel "Последние заказчики" do
          table_for Customer.limit(10).each do
            column("Имя") { |customer| link_to(customer.name, admin_customer_path(customer)) }
            # column(:email) { |customer| link_to(customer.customer_contacts.email, admin_customer_path(customer)) }
          end
        end
      end

      column do
        panel 'Подрядчики' do
          table_for Contractor.limit(10).each do
            column("Имя") { |contractor| link_to(contractor.name, admin_contractor_path(contractor)) }
            column("Текущая задача") { |contractor| contractor.orders.present? ? link_to(contractor.orders.first.id, admin_order_path(contractor.orders.first)) : nil }
          end
        end
      end
    end # columns


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
