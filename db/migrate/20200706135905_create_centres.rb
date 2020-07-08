class CreateCentres < ActiveRecord::Migration[6.0]
  def change
    create_table :centres do |t|
      t.string :store_code, index: true
      t.string :centre_title
      t.string :centre_address
      t.string :centre_type
      t.decimal :fixed_payment
      t.decimal :revenue_share
      t.integer :status

      t.timestamps
    end
  end
end
