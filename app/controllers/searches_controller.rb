class SearchesController < ApplicationController


  # def index
  #   @services = Service.new
  # end

  def new
    @services = Service.new
    @all_services = Service.all.sort_by(&:name)
  end

  #params[:service] gives services id
  #params[:max_price] gives max price
  #params[:min_price] gives min price


  def create
    @services = params[:service][:id].map {|service|
    Service.find(params[:service][:id])}.first

    @services_id = params[:service][:id].map(&:to_i)
    @max_price = params[:max_price].to_i
    @min_price = params[:min_price].to_i

    @posts = Post.all.select do |post|
      @services_id.include?(post.service_id) && post.max_price <= @max_price && post.min_price >= @min_price
    end
    render "show_search"
  end

  def show_search
    #maybe call a helper mathod here that gets results
  end

  def show
  end




end
