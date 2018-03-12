class CreateQuestionKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :question_keywords do |t|
      t.references :keyword, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
