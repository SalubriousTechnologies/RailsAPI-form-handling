class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :email
      t.bigint :mobile
      t.bigint :alternate_contact_no
      t.string :gender
      t.date :dob
      t.string :address
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.references :country, foreign_key: true
      t.integer :pincode
      t.string :default_language
      t.references :doctor_category, foreign_key: true
      t.float :fee
      t.string :role
      t.references :centre, foreign_key: true
      t.string :zoom_id
      t.string :designation
      t.string :medical_registration_no
      t.string :registration_state
      t.integer :registration_year
      t.text :work_experience
      t.text :detailed_experience
      t.text :awards_n_achievements
      t.text :summary
      t.integer :is_internal_doctor
      t.integer :is_email_confirmed
      t.integer :is_verified
      t.integer :is_approved
      t.integer :is_editable
      t.integer :is_tnc_accepted
      t.integer :is_qualified_mso
      t.integer :status
      t.string :confirmation_token
      t.timestamp :confirmed_at
      t.timestamp :confirmation_sent_at
      t.string :reset_password_token
      t.timestamp :reset_password_sent_at
      t.string :auth_token
      t.timestamp :auth_token_expiry
      t.bigint :created_by, references: :users, limit: 8
      t.bigint :approved_by, references: :users, limit: 8

      t.timestamps
    end
  end
end
