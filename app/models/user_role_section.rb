class UserRoleSection < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :section
end
