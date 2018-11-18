class AddNotificationToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :notification, :boolean, default: false
  end
end
