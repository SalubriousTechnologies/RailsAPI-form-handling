class CreateQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :qualifications do |t|
      t.string :qualification
      t.integer :status

      t.timestamps
    end
  end
end
