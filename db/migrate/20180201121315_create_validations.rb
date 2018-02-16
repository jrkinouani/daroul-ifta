class CreateValidations < ActiveRecord::Migration[5.1]
  def change
    create_table :validations do |t|
      t.references :answer, foreign_key: true
      t.references :admin, foreign_key: true

      t.timestamps
    end
    add_column :answers, :nb_validation, :integer, default: 0
  end
end
