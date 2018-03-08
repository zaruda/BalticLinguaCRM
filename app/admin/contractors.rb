ActiveAdmin.register Contractor do
  menu label: 'Подрядчики', priority: 3

  CONTRACTOR_STATUS = ENV['CONTRACTOR_STATUS'].split(',')

  permit_params :name, :department, :birthday, :invoices_from, :status
  form do |f|
    f.inputs do
      f.input :name
      f.input :department
      f.input :birthday, 
              as: :datepicker, 
              datepicker_options: {
                min_date: '1960-01-1',
                max_date: '+3D'
              }
      f.input :invoices_from
      f.input :status, as: :select, collection: CONTRACTOR_STATUS
    end
  f.actions
  end

  show title: :name do
    panel 'Основная информация' do
      attributes_table_for contractor, :name, :department, :birthday, :invoices_from, :status
    end

    panel 'Услуги' do
      table_for(contractor.contractor_services) do
        column :service
        column :language_from
        column :language_to
        tr class: 'action_items' do
          td link_to('Добавить услугу',
                     new_admin_contractor_contractor_service_path(contractor),
                     class: :button)
          td link_to('Редактировать услуги',
                     admin_contractor_contractor_service_path(contractor),
                     class: :button)
        end
      end
    end

    panel 'Заказы' do
      table_for contractor.orders do
        column :customer_id
        column :start_date_contractor
        column :end_date_contractor
        column :priority
        column :scope_of_work
        # tr class: 'action_items' do
        #   td link_to('Добавить услугу',
        #              new_admin_contractor_contractor_service_path(contractor),
        #              class: :button)
        #   td link_to('Редактировать услуги',
        #              admin_contractor_contractor_service_path(contractor),
        #              class: :button)
        end
    end

    panel 'Выплаты' do
      table_for contractor.payments do
        column :order_id
        column :amount
        column :status
      end
    end

    active_admin_comments
  end

  sidebar 'Контакты', only: :show do
    attributes_table_for contractor.contractor_contacts, :phone, :email
    div class: 'action_items' do
      link_to('Добавить',
              new_admin_contractor_contractor_contact_path(contractor),
              class: :button)
    end
  end

  # sidebar 'Услуги', only: :show do
  #   ul do
  #     contractor.contractor_services.each do |service|
  #       li "#{service.service.name} / #{service.language_from} / #{service.language_to}"
  #     end
  #   end
  #   div class: 'action_items' do
  #     td link_to('Добавить услугу',
  #                new_admin_contractor_contractor_service_path(contractor),
  #                class: :button)
  #     td link_to('Редактировать услуги',
  #                admin_contractor_contractor_service_path(contractor),
  #                class: :button)
  #   end
  # end
end
