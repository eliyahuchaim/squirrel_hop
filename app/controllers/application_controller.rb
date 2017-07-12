class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_vendor

  def current_user
    session[:user_id] ||= nil
  end

  def current_vendor
    session[:vendor_id] ||= nil
  end

  def user_logged_in?
    if current_user
    else
      redirect_to root_path
    end
  end

  def vendor_logged_in?
    if current_vendor
    else
      redirect_to root_path
    end
  end

end
