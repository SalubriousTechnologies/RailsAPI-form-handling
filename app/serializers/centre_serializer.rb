class CentreSerializer < ActiveModel::Serializer
  attributes :id, :store_code, :centre_title, :centre_address, :centre_type, :fixed_payment, :revenue_share, :status
end
