ActiveAdmin.register Contractor do
  menu label: 'Подрядчики', priority: 3

  permit_params :name, :department, :birthday, :invoices_from, :status

  scope :all
  scope :active
  scope :inactive

  form do |f|
    f.inputs do
      f.input :name, label: I18n.t('app.name')
      f.input :department, label: I18n.t('app.department')
      f.input :birthday,
              as: :datepicker,
              datepicker_options: {
                min_date: '1960-01-1',
                max_date: '+3D'
              },
              label: I18n.t('app.birthday')
      f.input :invoices_from, as: :select, collection: INVOICES_FROM, label: I18n.t('app.invoices_from')
      f.input :status, as: :select, collection: STATUS, label: I18n.t('app.status')
    end
    f.actions
  end

  show title: :name do
    panel 'Основная информация' do
      attributes_table_for contractor do
        row I18n.t('app.name') do
          contractor.name
        end
        row I18n.t('app.department') do
          contractor.department
        end
        row I18n.t('app.birthday') do
          contractor.birthday
        end
        row I18n.t('app.invoices_from') do
          contractor.invoices_from
        end
        row I18n.t('app.status') do
          contractor.status
        end
      end
    end

    panel 'Услуги' do
      table_for(contractor.contractor_services) do
        column(I18n.t('app.service')) { |service| service.service }
        column(I18n.t('app.language_from')) { |service| service.language_from }
        column(I18n.t('app.language_to')) { |service| service.language_to }
      end
      div class: 'action_items' do
        td link_to('Добавить услугу',
                new_admin_contractor_contractor_service_path(contractor),
                class: :button)
        td link_to('Редактировать услуги',
                admin_contractor_contractor_services_path(contractor),
                class: :button)
      end
    end

    panel 'Заказы' do
      table_for contractor.orders do
        column(I18n.t('app.order')) { |order| link_to(order.id, admin_order_path(order)) }
        column(I18n.t('app.customer')) { |order| link_to(order.customer_id, admin_customer_path(order)) }
        column(I18n.t('app.start_date_contractor')) { |order| order.start_date_contractor }
        column(I18n.t('app.end_date_contractor')) { |order| order.end_date_contractor }
        column(I18n.t('app.priority')) { |order| order.priority }
        column(I18n.t('app.scope_of_work')) { |order| order.scope_of_work }
        column(I18n.t('app.status')) { |order| order.status }
      end
    end

    panel 'Выплаты' do
      table_for contractor.payments do
        column(I18n.t('app.order')) { |payment| payment.order_id }
        column(I18n.t('app.amount')) { |payment| payment.amount }
        column(I18n.t('app.payment_status')) { |payment| payment.status }
      end
    end

    active_admin_comments
  end

  sidebar 'Контакты', only: :show do
    table_for contractor.contractor_contacts do
      column(I18n.t('app.phone')) {|contractor| contractor.phone }
      column(I18n.t('app.email')) {|contractor| div contractor.email }
    end

    div class: 'action_items' do
      div link_to('Редактировать',
                  admin_contractor_contractor_contacts_path(contractor),
                  class: :button)
      div link_to('Добавить',
                  new_admin_contractor_contractor_contact_path(contractor),
                  class: :button)
    end
  end

  sidebar 'Банковские реквизиты', only: :show do
    table_for(contractor.contractor_requisites) do
      column('Реквизит', &:requisite)
      column &:value
    end
    div class: 'action_items' do
      if contractor.contractor_requisites.present?
        div link_to('Добавить реквизит',
                    new_admin_contractor_contractor_requisite_path(contractor),
                    class: :button)
        div link_to('Редактировать',
                    admin_contractor_contractor_requisites_path(contractor),
                    class: :button)
      else
        link_to('Добавить реквизит',
                new_admin_contractor_contractor_requisite_path(contractor),
                class: :button)
      end

    end
  end

  sidebar 'Программы', only: :show do
    ul do
      contractor.contractor_skills.each do |skill|
        li skill.programm.name
      end
    end

    div class: 'action_items' do
      div link_to('Редактировать',
                  admin_contractor_contractor_skills_path(contractor),
                  class: :button)
      div link_to('Добавить',
                  new_admin_contractor_contractor_skill_path(contractor),
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
