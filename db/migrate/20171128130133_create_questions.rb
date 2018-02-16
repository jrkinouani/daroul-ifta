class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.references :category, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
