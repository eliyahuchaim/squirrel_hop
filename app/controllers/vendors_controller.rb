class VendorsController < ApplicationController

  before_action :vendor_logged_in?, :vendor_exists?, only: [:show]

  def index
    @vendors = Vendor.all
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
    @vendor = Vendor.find(current_vendor)
    @services = Service.all.sort_by(&:name)
  end


  def update
    @vendor = Vendor.find(current_vendor)
    @vendor.update(vendor_params)
    @vendor.services = []
    if !params[:vendor][:services].nil?
      params[:vendor][:services].each do |service|
        @vendor.services << Service.find(service)
      end
    end
    @vendor.save
    redirect_to vendor_path(@vendor)
  end

  def reviews
    @vendor = Vendor.find(current_vendor)
  end


  private

  def vendor_params
    params.require(:vendor).permit(:username, :password, :password_confirmation, :company_name, :street_address, :city, :state, :zip_code, :email, :phone)
  end
end
