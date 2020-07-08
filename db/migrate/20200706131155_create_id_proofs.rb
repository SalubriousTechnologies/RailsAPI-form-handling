class CreateIdProofs < ActiveRecord::Migration[6.0]
  def change
    create_table :id_proofs do |t|
      t.string :id_proof
      t.integer :status

      t.timestamps
    end
  end
end
