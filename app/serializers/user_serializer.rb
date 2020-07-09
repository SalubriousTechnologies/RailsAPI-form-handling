class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :mobile, :alternate_contact_no, :gender, :dob, :address, :city, :state, :country, :pincode, :default_language, :doctor_category, :fee, :role, :zoom_id, :profile_photo, :designation, :medical_registration_no, :registration_state, :registration_year, :work_experience, :detailed_experience, :awards_n_achievements, :summary, :doctor_type, :is_email_confirmed, :is_verified, :is_approved, :is_editable, :is_tnc_accepted, :status, :is_qualified_mso, :created_at, :centre

  has_many :user_qualifications
  has_many :user_id_proofs

  def profile_photo
    if object.profile_photo.attached?
      object.profile_photo.service_url
    end
  end

  def doctor_type
  	if !object[:is_internal_doctor].blank? && object[:role] == 'doctor'
	  	hash = {"0" => "External", "1" => "Internal"}
	  	hash["#{object[:is_internal_doctor]}"]
	  end
  end
end
