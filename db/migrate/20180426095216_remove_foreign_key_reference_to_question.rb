class RemoveForeignKeyReferenceToQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_reference :question_keywords, :keyword, foreign_key: true
    remove_reference :question_keywords, :question, foreign_key: true
    add_column :question_keywords, :keyword_id, :integer
    add_column :question_keywords, :question_id, :integer

    remove_reference :question_subcategories, :subcategory, foreign_key: true
    remove_reference :question_subcategories, :question, foreign_key: true
    add_column :question_subcategories, :subcategory_id, :integer
    add_column :question_subcategories, :question_id, :integer

    remove_reference :category_questions, :category, foreign_key: true
    remove_reference :category_questions, :question, foreign_key: true
    add_column :category_questions, :category_id, :integer
    add_column :category_questions, :question_id, :integer
  end
end
