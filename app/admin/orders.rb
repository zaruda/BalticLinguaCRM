ActiveAdmin.register Order do
  menu label: 'Заказы', priority: 4

  permit_params :status, :payment_status, :start_date_contractor, :end_date_contractor,
                :start_date_customer, :end_date_customer, :priority, :price, :description,
                :scope_of_work, :customer_id, :uploads, contractor_ids: []

  form multipart: true do |f|
    f.inputs do
      f.input :customer, label: I18n.t('app.customer')
      f.input :contractors, label: I18n.t('app.contractor')
      f.input :status,
              label: I18n.t('app.status'),
              as: :select,
              collection: ENV['ORDER_STATUS'].split(',')
      f.input :payment_status,
              label: I18n.t('app.payment_status'),
              as: :select,
              collection: ENV['PAYMENT_STATUS'].split(',')
      f.input :start_date_customer, as: :datetime_picker, label: I18n.t('app.start_date_customer')
      f.input :end_date_customer, as: :datetime_picker, label: I18n.t('app.end_date_customer')
      f.input :start_date_contractor, as: :datetime_picker, label: I18n.t('app.start_date_contractor')
      f.input :end_date_contractor, as: :datetime_picker, label: I18n.t('app.end_date_contractor')
      f.input :priority, input_html: { min: '0', max: '10' }, label: I18n.t('app.priority')
      f.input :price, label: I18n.t('app.price')
      f.input :scope_of_work, label: I18n.t('app.scope_of_work')
      f.input :uploads, as: :file, label: I18n.t('app.file')
      f.input :description, label: I18n.t('app.description')
        # order.uploads.each do |file|
        # link_to(file.filename, '#', onclick: ApplicationHelper::delete_attachment(file))
      # end
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column(I18n.t('app.customer'), :customer)
    column(I18n.t('app.priority'), :priority)
    column(I18n.t('app.start_date_customer'), :start_date_customer)
    column(I18n.t('app.end_date_customer'), :end_date_customer)
    column(I18n.t('app.payment_status'), :payment_status)
    column(I18n.t('app.status'), :status)
    actions
  end

  show do
    panel 'Основная информация' do
      attributes_table_for order do
        row 'Заказчик' do
          order.customer
        end
        row 'Приоритет' do
          order.priority
        end
        row 'Статус заказа' do
          status_tag(order.status)
        end
        row 'Статус оплаты' do
          status_tag(order.payment_status)
        end
        row 'Стоимость' do
          number_to_currency order.price
        end
      end
    end
    panel 'Сроки' do
      attributes_table_for order do
        row 'Начало работы (с заказчиком)' do
          order.start_date_customer
        end
        row 'Окончание работы (с заказчиком)' do
          order.end_date_customer
        end
        row 'Начало работы (с подрядчиком)' do
          order.start_date_contractor
        end
        row 'Окончание работы (с подрядчиком)' do
          order.end_date_contractor
        end
      end
    end
    panel 'Дополнительная информация' do
      attributes_table_for order do
        row 'Объем работы' do
          order.scope_of_work
        end
        row 'Прикрепленный файл' do
          if order.uploads.attached?
            order.uploads.each do |file|
              div link_to(file.filename, rails_blob_path(file, disposition: :attachment))
              end
            else
            status_tag 'Файлов нет'
          end

        end
        row 'Описание' do
          order.description
        end
      end
    end
    active_admin_comments
  end
  sidebar 'Исполнители', only: :show do
    ol do
      order.contractors.each do |contractor|
        li contractor.name
      end
    end
  end

end
