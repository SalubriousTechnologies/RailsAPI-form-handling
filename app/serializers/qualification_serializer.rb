class QualificationSerializer
	include FastJsonapi::ObjectSerializer
	attributes :id, :qualification, :status
end
