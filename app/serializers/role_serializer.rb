class RoleSerializer
	include FastJsonapi::ObjectSerializer
  attributes :id, :role, :role_title, :status
end
