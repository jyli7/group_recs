require 'open-uri'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_token
  
  def set_token
    HunchAPI.token = "b05a90da871cb1cbf32ad5a78ed0381469934c7d"
  end
end
