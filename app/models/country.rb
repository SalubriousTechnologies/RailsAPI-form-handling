class Country < ApplicationRecord
	has_many :states
	has_many :users
end
