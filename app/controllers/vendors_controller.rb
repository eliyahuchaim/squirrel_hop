class VendorsController < ApplicationController

  before_action :logged_in?, only: [:show]

  def index
  end


  def new
    @vendor = Vendor.new
  end


  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      session[:vendor_id] = @vendor.id
      redirect_to vendor_path(@vendor)
    else
      redirect_to new_vendor_path
    end
  end


  def show
    @vendor = Vendor.find(params[:id])
    @services = Vendor.find(params[:id]).services
  end

  def edit
    @vendor = Vendor.find(session[:vendor_id])
    @services = Service.all.sort_by(&:name)
  end


  def update
    byebug
    @vendor = Vendor.find(params[:id])
    @services = Service.find(params[:vendor][:services])
    @vendor.update(vendor_params)
    @vendor.save
    redirect_to vendor_path(@vendor)
  end


  private

  def vendor_params
    params.require(:vendor).permit(:username, :password, :password_confirmation, :company_name, :street_address, :city, :state, :zip_code, :email, :phone)
  end

  def logged_in?
    if current_vendor
    else
      redirect_to root_path
    end
  end

end
