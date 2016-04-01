class UsersController < ApplicationController

  # require "open-uri"
  require 'net/http'
  require 'json'
  
  def edit
    @cat = Cat.new
    current_user_token = current_user.token
    recent_photos_endpoint = "https://api.instagram.com/v1/users/self/media/recent/?access_token=" + current_user_token

    uri = URI.parse(recent_photos_endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response_hash = JSON.parse(response.body)
    @data = response_hash["data"]
  end
end