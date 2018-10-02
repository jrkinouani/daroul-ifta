class AddAnneefrToZakatnissabs < ActiveRecord::Migration[5.1]
  def change
    add_column :zakatnissabs, :anneefr, :integer
  end
end
