class SearchesController < ApplicationController
  def new
    @user = User.new
  end
end
