class Role < ApplicationRecord
	has_many :role_sections
	has_many :sections, through: :role_sections

	has_many :user_role_sections
	has_many :users, through: :user_role_sections, :class_name => 'User'
end
