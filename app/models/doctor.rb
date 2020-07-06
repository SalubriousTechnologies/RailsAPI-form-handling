class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :fees, presence: true
  has_one :revenue_share, inverse_of: :doctor, dependent: :destroy
  accepts_nested_attributes_for :revenue_share
  has_many_attached :documents

  def documents_url
    if documents.attached?
      documents.map { |document| signed_url_of_s3_object(document.blob.key, 600) }
    end
  end

  def signed_url_of_s3_object(blob_key, expiration_time_in_minutes)
    bucket = Aws::S3::Bucket.new(Rails.application.credentials.dig(:aws, :bucket))
    object = bucket.object(blob_key)
    object.presigned_url(:get, expires_in: expiration_time_in_minutes)
  end
end
