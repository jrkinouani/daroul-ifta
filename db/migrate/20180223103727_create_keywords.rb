class CreateKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :keywords do |t|
      t.references :subcategory, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
