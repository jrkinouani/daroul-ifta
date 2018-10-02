class CreateZakatnissabs < ActiveRecord::Migration[5.1]
  def change
    create_table :zakatnissabs do |t|
      t.string :mois
      t.integer :an
      t.decimal :prix_or
      t.decimal :prix_argent
      t.decimal :mahr_minimum
      t.decimal :mahr_fatimi
      t.decimal :fidyah
      t.decimal :nissab_zakate

      t.timestamps
    end
  end
end
