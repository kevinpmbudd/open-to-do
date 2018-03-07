class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |name, password|
      user = User.find_by_name(name)
      user && user.authenticate(password)
    end
  end
end
