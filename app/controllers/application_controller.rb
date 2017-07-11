class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_vendor

  def current_user
    session[:user_id] ||= nil
  end

  def current_vendor
    session[:vendor_id] ||= nil
  end

end
