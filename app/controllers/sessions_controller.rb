class SessionsController < ApplicationController

  # https://github.com/intridea/omniauth/wiki
  # https://github.com/ropiku/omniauth-instagram

  def create
    p auth_hash
    # @user = User.find_or_create_from_auth_hash(auth_hash)
    # self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end