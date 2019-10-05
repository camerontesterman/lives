class CreateJoinTableCountriesLanguages < ActiveRecord::Migration[5.2]
  def change
    create_join_table :countries, :languages do |t|
      t.index [:country_id, :language_id]
      t.index [:language_id, :country_id]
    end
  end
end
