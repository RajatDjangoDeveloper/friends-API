class ApplicationController < ActionController::API
  # protect_from_forgery
  include ActionController::RequestForgeryProtection
end
