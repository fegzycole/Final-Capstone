class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include Jwt
end
