class Centre < ApplicationRecord
	has_many :users

	validates :store_code, presence: true, uniqueness: { case_sensitive: false }
end
