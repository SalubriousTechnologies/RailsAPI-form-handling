class CreateVisitDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :visit_details do |t|
      t.string :chief_complaint
      t.integer :visit_id
      t.jsonb :complaint_details, null: false, default: '{}'

      t.timestamps
    end
    add_index :visit_details, :complaint_details, using: :gin
    add_index :visit_details, :chief_complaint
  end
end
