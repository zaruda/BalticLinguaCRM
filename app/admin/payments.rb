ActiveAdmin.register Payment do
  menu label: 'Выплаты подрядчикам'
  permit_params :order_id, :contractor_id, :amount, :status, :attachments

  form multipart: true do |f|
    f.inputs do
      f.input :order, as: :select , collection: Order.all.map(&:id),  label: I18n.t('app.order')
      f.input :contractor, label: I18n.t('app.contractor')
      f.input :amount, label: I18n.t('app.amount')
      f.input :status, label: I18n.t('app.payment_status')
      f.input :attachments, as: :file, label: I18n.t('app.file')
    end
    f.actions
  end

  show do
    panel 'Детали' do
      attributes_table_for payment do
        row I18n.t('app.payment_status') do
          payment.status
        end
        row I18n.t('app.contractor') do
          payment.contractor
        end
        row I18n.t('app.order') do
          payment.order
        end
        row I18n.t('app.amount') do
          payment.amount
        end
        row I18n.t('app.file') do
          if payment.attachments.present?
            payment.attachments.each do |file|
              div link_to(file.filename, rails_blob_path(file, disposition: :attachment))
            end
          else
            status_tag 'Файлов нет'
          end
        end
      end
    end
    active_admin_comments
  end

end
