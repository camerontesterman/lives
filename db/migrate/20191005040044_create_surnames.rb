class CreateSurnames < ActiveRecord::Migration[5.2]
  def change
    create_table :surnames do |t|
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
