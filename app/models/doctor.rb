class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :fees, presence: true
end
