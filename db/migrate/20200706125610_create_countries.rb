class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :country_iso_code_2
      t.string :country_iso_code_3
      t.string :country_name
      t.integer :status

      t.timestamps
    end
  end
end
