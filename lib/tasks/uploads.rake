namespace :uploads do
  task :clear_uploads do
    orders = Order.all
    orders.each do |order|
      if order.uploads.present?
        order.uploads.each(&:purge_later)
      end
    end
  end
end