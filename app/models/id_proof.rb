class IdProof < ApplicationRecord
	has_many :user_id_proofs
  has_many :users, through: :user_id_proofs
end
