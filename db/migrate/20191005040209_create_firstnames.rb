class CreateFirstnames < ActiveRecord::Migration[5.2]
  def change
    create_table :firstnames do |t|
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
