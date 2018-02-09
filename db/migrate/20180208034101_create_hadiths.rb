class CreateHadiths < ActiveRecord::Migration[5.1]
  def change
    create_table :hadiths do |t|
      t.string :hadith

      t.timestamps
    end
  end
end
