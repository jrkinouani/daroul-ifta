class AddWriterIdToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :writer_id, :integer, index: true
  end
end
