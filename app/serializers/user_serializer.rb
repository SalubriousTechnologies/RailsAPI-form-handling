class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :mobile, :alternate_contact_no, :gender, :dob, :address, :city, :state, :country, :pincode, :default_language, :doctor_category, :fee, :role, :zoom_id, :profile_photo, :designation, :medical_registration_no, :registration_state, :registration_year, :work_experience, :detailed_experience, :awards_n_achievements, :summary, :doctor_type, :is_email_confirmed, :is_verified, :is_approved, :is_editable, :is_tnc_accepted, :status, :is_qualified_mso, :created_at, :centre

  has_many :user_qualifications
  has_many :user_id_proofs

  def profile_photo
    if object.profile_photo.attached?
      object.profile_photo.service_url
    end
  end

  def city
    if !object[:city_id].blank?
      { id: self.object.city.id, name: self.object.city.city_name }
    end
  end

  def state
    if !object[:state_id].blank?
      { id: self.object.state.id, name: self.object.state.state_name }
    end
  end

  def country
    if !object[:country_id].blank?
      { id: self.object.country.id, name: self.object.country.country_name }
    end
  end

  def default_language
    if !object[:default_language].blank?
  	 {key: object[:default_language], value: object[:default_language].capitalize()}
    end
  end

  def doctor_category
  	if !object[:doctor_category_id].blank?
    	{ id: self.object.doctor_category.id, category_title: self.object.doctor_category.category_title }
    end
  end

  # def role
  #   if !object[:role].blank?
  #   	role = Role.find_by_role(object[:role])
  #   	role.role_title if role
  #   end
  # end

  def doctor_type
  	if !object[:is_internal_doctor].blank? && object[:role] == 'doctor'
	  	hash = {"0" => "External", "1" => "Internal"}
	  	hash["#{object[:is_internal_doctor]}"]
	  end
  end

  def is_email_confirmed
  	if !object[:is_email_confirmed].blank?
	  	hash = {"0" => "Pending", "1" => "Confirmed"}
	  	{ key: object[:is_email_confirmed], value: hash["#{object[:is_email_confirmed]}"]}
	  end
  end

  def is_verified
  	if !object[:is_verified].blank?
	  	hash = {"0" => "Pending", "1" => "Verified"}
	  	{ key: object[:is_verified], value: hash["#{object[:is_verified]}"]}
	  end
  end

  def is_approved
  	if !object[:is_approved].blank?
	  	hash = {"0" => "Pending", "1" => "Approved"}
	  	{ key: object[:is_approved], value: hash["#{object[:is_approved]}"]}
	  end
  end

  def is_editable
  	if !object[:is_editable].blank?
	  	hash = {"0" => "Non Editable", "1" => "Editable"}
	  	{ key: object[:is_editable], value: hash["#{object[:is_editable]}"]}
	  end
  end

  def status
  	if !object[:status].blank?
	  	hash = {"0" => "Inactive", "1" => "Active"}
	  	{ key: object[:status], value: hash["#{object[:status]}"]}
	  end
  end

  def is_qualified_mso
  	if !object[:is_qualified_mso].blank?
	  	hash = {"0" => "Trainee", "1" => "Qualified"}
	  	{ key: object[:is_qualified_mso], value: hash["#{object[:is_qualified_mso]}"]}
	  end
  end

  def centre
    if !object[:centre_id].blank?
      { id: self.object.centre.id, store_code: self.object.centre.store_code, centre_title: self.object.centre.centre_title, centre_address: self.object.centre.centre_address, centre_type: self.object.centre.centre_type, fixed_payment: self.object.centre.fixed_payment, revenue_share: self.object.centre.revenue_share, status: self.object.centre.status }
    end
  end
end
