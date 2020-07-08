class CreateDoctorCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_categories do |t|
      t.string :category_code
      t.string :category_title
      t.float :fee
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
