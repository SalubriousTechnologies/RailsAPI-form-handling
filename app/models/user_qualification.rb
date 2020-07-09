class UserQualification < ApplicationRecord
  belongs_to :user
  belongs_to :qualification

  has_many_attached :documents
end
