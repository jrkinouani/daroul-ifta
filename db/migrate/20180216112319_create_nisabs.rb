class CreateNisabs < ActiveRecord::Migration[5.1]
  def change
    create_table :nisabs do |t|
      t.string :title
      t.string :mois
      t.integer :price_or
      t.integer :price_silver
      t.integer :zakat_fatimi
      t.integer :zakat_fidiyah
      t.integer :nisab_zakat

      t.timestamps
    end
  end
end
