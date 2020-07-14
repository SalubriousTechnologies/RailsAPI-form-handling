class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :username, :email, :mobile, :alternate_contact_no, :gender, :dob, :address, :pincode, :fee, :zoom_id, :designation, :medical_registration_no, :registration_state, :registration_year, :work_experience, :detailed_experience, :awards_n_achievements, :summary, :is_tnc_accepted, :created_at

  attribute :doctor_type do |object|
    if !object.is_internal_doctor.blank? && object.role == 'doctor'
      hash = {"0" => "External", "1" => "Internal"}
      hash["#{object.is_internal_doctor}"]
    end
  end

  attribute :profile_photo do |object|
    if object.profile_photo.attached?
      object.profile_photo.service_url
    end
  end

  attribute :city do |object|
    if !object.city_id.blank?
      { id: object.city.id, name: object.city.city_name }
    end
  end

  attribute :state do |object|
    if !object.state_id.blank?
      { id: object.state.id, name: object.state.state_name }
    end
  end

  attribute :country do |object|
    if !object.country_id.blank?
      { id: object.country.id, name: object.country.country_name }
    end
  end

  attribute :default_language do |object|
    if !object.default_language.blank?
     {key: object.default_language, value: object.default_language.capitalize()}
    end
  end

  attribute :doctor_category do |object|
    if !object.doctor_category_id.blank?
      { id: object.doctor_category.id, category_title: object.doctor_category.category_title }
    end
  end

  attribute :role do |object|
    if !object.role.blank?
      role = Role.find_by_role(object.role)
      role.role_title if role
    end
  end

  attribute :is_email_confirmed do |object|
    if !object.is_email_confirmed.blank?
      hash = {"0" => "Pending", "1" => "Confirmed"}
      { key: object.is_email_confirmed, value: hash["#{object.is_email_confirmed}"]}
    end
  end

  attribute :is_verified do |object|
    if !object.is_verified.blank?
      hash = {"0" => "Pending", "1" => "Verified"}
      { key: object.is_verified, value: hash["#{object.is_verified}"]}
    end
  end

  attribute :is_approved do |object|
    if !object.is_approved.blank?
      hash = {"0" => "Pending", "1" => "Approved"}
      { key: object.is_approved, value: hash["#{object.is_approved}"]}
    end
  end

  attribute :is_editable do |object|
    if !object.is_editable.blank?
      hash = {"0" => "Non Editable", "1" => "Editable"}
      { key: object.is_editable, value: hash["#{object.is_editable}"]}
    end
  end

  attribute :status do |object|
    if !object.status.blank?
      hash = {"0" => "Inactive", "1" => "Active"}
      { key: object.status, value: hash["#{object.status}"]}
    end
  end

  attribute :is_qualified_mso do |object|
    if !object.is_qualified_mso.blank?
      hash = {"0" => "Trainee", "1" => "Qualified"}
      { key: object.is_qualified_mso, value: hash["#{object.is_qualified_mso}"]}
    end
  end

  attribute :centre do |object|
    if !object.centre_id.blank?
      { id: object.centre.id, store_code: object.centre.store_code, centre_title: object.centre.centre_title, centre_address: object.centre.centre_address, centre_type: object.centre.centre_type, fixed_payment: object.centre.fixed_payment, revenue_share: object.centre.revenue_share, status: object.centre.status }
    end
  end

  attribute :user_qualifications do |object|
    UserQualificationSerializer.new(object.user_qualifications).serializable_hash
  end

  attribute :user_id_proofs do |object|
    UserIdProofSerializer.new(object.user_id_proofs).serializable_hash
  end
end
