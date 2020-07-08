class CreateUserQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_qualifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :qualification, null: false, foreign_key: true
      t.string :degree
      t.string :university
      t.integer :status
      t.bigint :verified_by, references: :users, limit: 8

      t.timestamps
    end
  end
end
