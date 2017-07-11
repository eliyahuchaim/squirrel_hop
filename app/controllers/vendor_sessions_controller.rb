class VendorSessionsController < ApplicationController


  def new
  end

  def create
    @vendor = Vendor.find_by(:username, params[:username])
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


end
