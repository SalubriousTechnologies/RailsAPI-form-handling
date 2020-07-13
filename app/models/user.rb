class User < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :state, optional: true
  belongs_to :country, optional: true
  belongs_to :doctor_category, optional: true
  belongs_to :centre, optional: true
  
  has_many :user_qualifications, inverse_of: :user, dependent: :destroy
  has_many :qualifications, through: :user_qualifications
  accepts_nested_attributes_for :user_qualifications, reject_if: proc { |a| a[:qualification_id].blank? }

  has_many :user_id_proofs, inverse_of: :user, dependent: :destroy
  has_many :id_proofs, through: :user_id_proofs
  accepts_nested_attributes_for :user_id_proofs, reject_if: proc { |a| a[:id_proof_id].blank? }

  has_many :user_role_sections, inverse_of: :user, dependent: :destroy
  has_many :roles, through: :user_role_sections, :class_name => 'Role'
  has_many :sections, through: :user_role_sections, :class_name => 'Section'

  has_one_attached :profile_photo

  has_secure_password

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validates :password, presence: true, length: { in: 8..128 }, format: { with: PASSWORD_FORMAT }, confirmation: true, on: :create 
  validates :password, allow_nil: true, length: { in: 8..128 }, format: { with: PASSWORD_FORMAT }, confirmation: true, on: :update
  validates :password_confirmation, presence: true, on: :create

  validates :name, presence: true, format: { with: /^[a-zA-Z ]*$/, multiline: true }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, format: { with: /^[a-zA-Z0-9_\.]*$/, multiline: true }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :mobile, presence: true, numericality: { only_integer: true }, allow_nil: true, length: { is: 10 }
  validates :alternate_contact_no, numericality: { only_integer: true }, allow_nil: true, length: { is: 10 }
  validates :gender, inclusion: { in: %w(male female transgender), message: "is not valid" }
  validates :pincode, numericality: { only_integer: true }, allow_nil: true, length: { is: 6 }
  validates :default_language, inclusion: { in: %w(hindi english), message: "is not valid" }
  validates :fee, numericality: { only_integer: true }, allow_nil: true
  validates :registration_year, allow_nil: true, inclusion: { in: 1970..Date.today.year, message: "is invalid" }, format: { with: /(19|20)\d{2}/i, message: "should be a four-digit year" }
  validates :role, presence: true
  validates :centre_id, presence: true, if: -> { ['mso_owner', 'mso_staff'].include? self.role }
  validates :doctor_category_id, presence: true, if: -> { self.role == 'doctor' }
  validates :designation, presence: true, if: -> { self.role == 'doctor' }
  validates :medical_registration_no, presence: true, if: -> { self.role == 'doctor' }
  validates :registration_state, presence: true, if: -> { self.role == 'doctor' }
  validates :registration_year, presence: true, if: -> { self.role == 'doctor' }

  validate :validate_dob?
  validate :validate_role

  before_save :downcase_fields

  private
    def downcase_fields
      self.email.downcase!
      self.username.downcase!
    end

    def validate_dob?
      if self.dob.present?
        begin
          if Date.parse(self.dob.to_s) > Date.today
            self.errors.add(:dob, "is not valid")
          end
        rescue
          self.errors.add(:dob, "is not valid")
        end
      end
    end

    def validate_role
      if self.role.present? && !Role.find_by(role: self.role, status: 1)
        self.errors.add(:role, "is not valid")
      end
    end
end
