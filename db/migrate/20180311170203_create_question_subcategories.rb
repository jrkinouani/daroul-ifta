class CreateQuestionSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :question_subcategories do |t|
      t.references :subcategory, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
