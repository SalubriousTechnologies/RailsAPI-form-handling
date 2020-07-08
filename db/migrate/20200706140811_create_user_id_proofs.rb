class CreateUserIdProofs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_id_proofs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :id_proof, null: false, foreign_key: true
      t.integer :status
      t.bigint :verified_by, references: :users, limit: 8

      t.timestamps
    end
  end
end
