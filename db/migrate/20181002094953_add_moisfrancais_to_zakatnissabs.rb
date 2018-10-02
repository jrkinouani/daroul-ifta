class AddMoisfrancaisToZakatnissabs < ActiveRecord::Migration[5.1]
  def change
    add_column :zakatnissabs, :moisfrancais, :string
  end
end
