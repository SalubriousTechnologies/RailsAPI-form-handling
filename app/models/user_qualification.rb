class UserQualification < ApplicationRecord
  belongs_to :user
  belongs_to :qualification

  # accepts_nested_attributes_for :qualification

  has_many_attached :documents
end
