class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :fees, presence: true
  has_one :revenue_share, inverse_of: :doctor, dependent: :destroy
  accepts_nested_attributes_for :revenue_share
  has_many_attached :documents

  def documents_url
    if documents.attached?
      documents.map { |document| document.service_url }
    end
  end
end
