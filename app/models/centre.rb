class Centre < ApplicationRecord
	has_many :users

	validates :store_code, presence: true, uniqueness: { case_sensitive: false }
	validates :centre_title, presence: true
	validates :centre_address, presence: true
	validates :centre_type, presence: true
	validates :fixed_payment, presence: true
	validates :revenue_share, presence: true
end
