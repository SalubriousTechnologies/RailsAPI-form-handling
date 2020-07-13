class RoleSerializer < ActiveModel::Serializer
  attributes :id, :role, :role_title, :status
end
