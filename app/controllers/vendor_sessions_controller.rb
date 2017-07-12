class VendorSessionsController < ApplicationController

  before_action :logged_in?, only: [:new]

  def new
    # byebug
  end

  def create
    @vendor = Vendor.find_by(username: params[:username])
    if @vendor.authenticate(params[:password])
      session[:vendor_id] = @vendor.id
      redirect_to vendor_path(@vendor)
    else
      redirect_to vendor_login_path
    end
  end

  def destroy
    session[:vendor_id] = nil
    redirect_to root_path
  end


  private

  def logged_in?
    if current_vendor
      @vendor = Vendor.find(session[:vendor_id])
      redirect_to vendor_path(@vendor)
    end
  end

end
