class CreateUserRoleSections < ActiveRecord::Migration[6.0]
  def change
    create_table :user_role_sections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
