class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.references :state, null: false, foreign_key: true
      t.string :city_name
      t.integer :status

      t.timestamps
    end
  end
end
