class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.references :country, null: false, foreign_key: true
      t.string :state_code
      t.string :state_name
      t.integer :status

      t.timestamps
    end
  end
end
