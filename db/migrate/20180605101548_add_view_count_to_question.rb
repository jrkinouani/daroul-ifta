class AddViewCountToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :view_count, :integer, default: 0
  end
end
