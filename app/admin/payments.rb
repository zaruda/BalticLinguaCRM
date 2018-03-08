ActiveAdmin.register Payment do
  menu label: 'Выплаты подрядчикам'
  permit_params :order_id, :contractor_id, :amount, :status

  form do |f|
    f.inputs do
      f.input :order, as: :select , collection: Order.all.map(&:id),  label: 'Заказ (id)'
      f.input :contractor, label: 'Подрядчик'
      f.input :amount, label: 'Размер выплаты'
      f.input :status, label: 'Cтатус выплаты'
    end
    f.actions
  end

end
