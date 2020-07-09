class User < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :state, optional: true
  belongs_to :country, optional: true
  belongs_to :doctor_category, optional: true
  belongs_to :centre, optional: true, dependent: :destroy
  accepts_nested_attributes_for :centre

  has_many :user_qualifications, inverse_of: :user, dependent: :destroy
  has_many :qualifications, through: :user_qualifications
  accepts_nested_attributes_for :user_qualifications

  has_many :user_id_proofs, inverse_of: :user, dependent: :destroy
  has_many :id_proofs, through: :user_id_proofs
  accepts_nested_attributes_for :user_id_proofs

  has_one_attached :profile_photo

  has_secure_password

  validates :name, presence: true, format: { with: /^[a-zA-Z ]*$/, multiline: true }
end
