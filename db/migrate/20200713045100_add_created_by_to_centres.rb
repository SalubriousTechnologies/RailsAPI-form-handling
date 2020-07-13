class AddCreatedByToCentres < ActiveRecord::Migration[6.0]
  def change
  	add_column :centres, :created_by, :bigint, references: :users, limit: 8
  end
end
