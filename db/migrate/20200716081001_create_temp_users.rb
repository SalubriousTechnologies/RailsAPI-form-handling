class CreateTempUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :temp_users do |t|
      t.references :user, null: false, foreign_key: true
      t.string :password_digest
      t.bigint :mobile
      t.bigint :alternate_contact_no
      t.date :dob
      t.string :address
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.references :country, foreign_key: true
      t.integer :pincode
      t.string :default_language
      t.references :doctor_category, foreign_key: true
      t.string :role
      t.string :medical_registration_no
      t.string :registration_state
      t.integer :registration_year
      t.text :work_experience
      t.text :detailed_experience
      t.text :awards_n_achievements
      t.text :summary
      t.integer :is_qualified_mso
      t.text :remark
      t.integer :approval_status
      t.bigint :approved_by, references: :users, limit: 8
      t.timestamp :approved_at

      t.timestamps
    end
  end
end
