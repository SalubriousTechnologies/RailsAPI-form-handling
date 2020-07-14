class CentreSerializer
	include FastJsonapi::ObjectSerializer
  attributes :id, :store_code, :centre_title, :centre_address, :centre_type, :fixed_payment, :revenue_share, :status
end
