class UserIdProof < ApplicationRecord
  belongs_to :user
  belongs_to :id_proof

  has_many_attached :documents
end
