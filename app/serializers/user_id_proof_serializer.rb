class UserIdProofSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :status

  attribute :user do |object|
    if !object.user_id.blank?
      { id: object.user.id, name: object.user.name }
    end
  end

  attribute :id_proof do |object|
    if !object.id_proof_id.blank?
      { id: object.id_proof.id, id_proof: object.id_proof.id_proof }
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
