class UserQualification < ApplicationRecord
  belongs_to :user
  belongs_to :qualification, optional: true

  has_many_attached :documents

  validates :qualification_id, presence: true, if: -> { user.role == 'doctor' }
end
