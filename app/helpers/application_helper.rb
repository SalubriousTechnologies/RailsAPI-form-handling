module ApplicationHelper
	def current_user
		require 'ostruct'
    return OpenStruct.new({id: 7})
	end		
end
