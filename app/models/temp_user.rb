class TempUser < ApplicationRecord
  belongs_to :user
  belongs_to :city, optional: true
  belongs_to :state, optional: true
  belongs_to :country, optional: true
  belongs_to :doctor_category, optional: true

  has_one_attached :profile_photo

  attr_accessor :password, :password_confirmation

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validates :password, allow_blank: true, length: { in: 8..128 }, format: { with: PASSWORD_FORMAT }, confirmation: true, if: :password
  validates :password_confirmation, allow_blank: true, presence: {if: -> {!password.nil?}}

  validates :mobile, allow_nil: true, numericality: { only_integer: true }, allow_nil: true, length: { is: 10 }
  validates :alternate_contact_no, numericality: { only_integer: true }, allow_nil: true, length: { is: 10 }
  validates :pincode, numericality: { only_integer: true }, allow_nil: true, length: { is: 6 }
  validates :default_language, allow_nil: true, inclusion: { in: %w(hindi english), message: "is not valid" }, if: :default_language?
  validates :registration_year, allow_nil: true, inclusion: { in: 1970..Date.today.year, message: "is invalid" }, format: { with: /(19|20)\d{2}/i, message: "should be a four-digit year" }
  validates :role, presence: true
  
  validate :validate_dob?
  validate :validate_role

  private
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
