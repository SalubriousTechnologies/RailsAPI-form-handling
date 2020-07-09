class Qualification < ApplicationRecord
	has_many :user_qualifications, inverse_of: :qualifications
	has_many :users, through: :user_qualifications
end
