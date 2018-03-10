ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc{ I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Последние заказы' do
          table_for Order.limit(10) do
            column('ID') { |order| link_to(order.id, admin_order_path(order)) }
            column('Заказчик') { |order| link_to(order.customer.name, admin_customer_path(order.customer)) }
            column('Статус выполнения') { |order| status_tag(order.status) }
            column('Документы') { |order| order.uploads.present? ? 'Да' : 'Нет' }
          end
        end
      end

      column do
        panel "Последние заказчики" do
          table_for Customer.limit(10).each do
            column("Имя") { |customer| link_to(customer.name, admin_customer_path(customer)) }
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
    end
  end
end
