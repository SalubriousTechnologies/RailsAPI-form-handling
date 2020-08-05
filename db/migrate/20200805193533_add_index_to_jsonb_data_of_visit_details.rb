class AddIndexToJsonbDataOfVisitDetails < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE INDEX associated_symptom_complaint_details_on_visit_details ON visit_details 
                    ((complaint_details->>'associated_symptom'))
    SQL
  end

  def down
    remove_index :visit_details, name: :associated_symptom_complaint_details_on_visit_details
  end
end
