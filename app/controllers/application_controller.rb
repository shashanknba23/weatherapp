class ApplicationController < ActionController::Base
	def get_ip_address
		if Rails.env.production?
  		request.remote_ip
		else
  		client_ip = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
		end
	end
end
