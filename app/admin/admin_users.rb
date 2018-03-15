ActiveAdmin.register AdminUser do
  menu label: "Пользователи", priority: 1

  STATUS = ENV['STATUS'].split(',')
  ORDER_STATUS = ENV['ORDER_STATUS'].split(',')
  PAYMENT_STATUS = ENV['PAYMENT_STATUS'].split(',')
  REDACTOR_TASK_STATUS = ENV['REDACTOR_TASK_STATUS'].split(',')
  BILL_TYPES = ENV['BILL'].split(',')
  PAYMENT_TYPES = ENV['PAYMENT_TYPES'].split(',')
  APPLICATION_TYPES = ENV['APPLICATION_TYPES'].split(',')
  INVOICES_FROM = ENV['INVOICES_FROM'].split(',')
  PRIORITY_TYPES = ENV['PRIORITY_TYPES'].split(',')

  permit_params :email, :name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
