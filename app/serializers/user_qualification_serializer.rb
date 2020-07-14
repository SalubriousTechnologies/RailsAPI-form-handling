class UserQualificationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :degree, :university, :status

  attribute :user do |object|
  	if !object.user_id.blank?
      { id: object.user.id, name: object.user.name }
    end
  end

  attribute :qualification do |object|
    if !object.qualification_id.blank?
      { id: object.qualification.id, qualification: object.qualification.qualification }
    end
  end

  attribute :verified_by do |object|
    if !object.verified_by.blank?
      user = User.find(object.verified_by)
      { id: user.id, name: user.name }
    end
  end

  attribute :document do |object|
    if object.documents.attached?
      object.documents[0].service_url
    end
  end
end
