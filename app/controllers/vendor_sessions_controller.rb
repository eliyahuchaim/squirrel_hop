class VendorSessionsController < ApplicationController

  before_action :vendor_logged_in?, only: [:destroy]

  def new
    redirect_to_vendor if !current_vendor.nil?
    redirect_to_user if !current_user.nil?
  end

  def create
    @vendor = Vendor.find_by(username: params[:username])
    if !@vendor.nil? && @vendor.authenticate(params[:password])
      session[:vendor_id] = @vendor.id
      redirect_to vendor_path(@vendor)
    else
      flash[:notice] = @vendor.nil? ? "Username does not exist" : "password is incorrect"
      redirect_to vendors_login_path
    end
  end

  def destroy
    session[:vendor_id] = nil
    redirect_to root_path
  end


  private
  def redirect_to_user
    redirect_to users_path(current_user)
  end
end
