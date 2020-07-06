require 'aws-sdk-s3'
class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :fees, presence: true
  has_one :revenue_share, inverse_of: :doctor, dependent: :destroy
  accepts_nested_attributes_for :revenue_share
  has_many_attached :documents

  def documents_url
    if documents.attached?
      signed_url_of_s3_objects(Array(documents), 600)
    end
  end

  def signed_url_of_s3_objects(attachments, expiration_time_in_minutes)
    s3 = Aws::S3::Resource.new(region: Rails.application.credentials.dig(:aws, :region))
    bucket = s3.bucket(Rails.application.credentials.dig(:aws, :bucket))
    blob_keys = attachments.map { |attachment| attachment.blob.key }
    blob_keys.map { |blob_key| bucket.object(blob_key).
                    presigned_url(:get, expires_in: expiration_time_in_minutes) }
  end
end
