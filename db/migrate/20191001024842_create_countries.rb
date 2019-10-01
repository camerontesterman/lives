class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :country_code, null: false
      t.integer :population, null: false
      t.timestamps
    end
  end
end
