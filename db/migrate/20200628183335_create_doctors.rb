class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.date :dob
      t.integer :fees

      t.timestamps
    end
  end
end
