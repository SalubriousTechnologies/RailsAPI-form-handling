class CreateRoleSections < ActiveRecord::Migration[6.0]
  def change
    create_table :role_sections do |t|
      t.references :role, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
