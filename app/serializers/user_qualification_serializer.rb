class UserQualificationSerializer < ActiveModel::Serializer
  attributes :id, :user, :qualification, :degree, :university, :verified_by, :status, :document

  def user
    if !object[:user_id].blank?
      { id: self.object.user.id, name: self.object.user.name }
    end
  end

  def qualification
    if !object[:qualification_id].blank?
      { id: self.object.qualification.id, qualification: self.object.qualification.qualification }
    end
  end

  def verified_by
    if !object[:verified_by].blank?
      user = User.find(object[:verified_by])
      { id: user.id, name: user.name }
    end
  end

  def document
    if object.documents.attached?
      object.documents[0].service_url
    end
  end
end
