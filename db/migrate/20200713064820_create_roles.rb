class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :role
      t.string :role_title
      t.integer :status

      t.timestamps
    end
  end
end
