class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :section
      t.string :section_title
      t.string :visibility
      t.integer :status

      t.timestamps
    end
  end
end
