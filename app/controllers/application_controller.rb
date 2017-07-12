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
      redirect_to users_login_path
    end
  end

  def vendor_logged_in?
    if current_vendor
    else
      redirect_to vendors_login_path
    end
  end

  def users_page?
    if current_user == params[:id].to_i
    else
      redirect_to user_path(current_user)
    end
  end

  def vendor_page?
    if current_vendor == params[:id].to_i
    else
      redirect_to vendor_path(current_vendor)
    end
  end

  def vendors_repsonse?
    redirect_to vendor_path(current_user) if !Vendor.find(current_vendor).responses.include?(Response.find(params[:id]))
  end

  def users_posts?
    redirect_to user_path(current_user) if !User.find(current_user).posts.include?(Post.find(params[:id]))
  end
end
