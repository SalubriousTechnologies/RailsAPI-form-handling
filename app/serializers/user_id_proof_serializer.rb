class UserIdProofSerializer < ActiveModel::Serializer
  attributes :id, :user, :id_proof, :verified_by, :status, :document

  def user
    if !object[:user_id].blank?
      { id: self.object.user.id, name: self.object.user.name }
    end
  end

  def id_proof
    if !object[:id_proof_id].blank?
      { id: self.object.id_proof.id, id_proof: self.object.id_proof.id_proof }
    end
  end

  # def verified_by
  #   if !object[:verified_by].blank?
  #     user = User.find(object[:verified_by])
  #     { id: user.id, name: user.name }
  #   end
  # end

  def document
    if object.documents.attached?
      object.documents[0].service_url
    end
  end
end
