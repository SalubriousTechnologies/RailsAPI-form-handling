class IdProofSerializer
	include FastJsonapi::ObjectSerializer
  attributes :id, :id_proof, :status
end
