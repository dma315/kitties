class SessionsController < ApplicationController

  # https://github.com/intridea/omniauth/wiki
  # https://github.com/ropiku/omniauth-instagram

  def create
    insta_hash = {}
    insta_hash["token"] = auth_hash.credentials.token
    insta_hash["name"] = auth_hash.extra.raw_info.full_name
    insta_hash["username"] = auth_hash.extra.raw_info.username
    insta_hash["provider"] = auth_hash.provider
    insta_hash["uid"] = auth_hash.uid.to_i
    insta_hash["image_url"] = auth_hash.extra.raw_info.profile_picture
    @user = User.find_or_create_by(uid: insta_hash["uid"])
    @user.update_attributes(insta_hash)
    self.current_user = @user
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  protected

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? nil : user.id
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end