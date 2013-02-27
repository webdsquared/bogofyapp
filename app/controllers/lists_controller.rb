class ListsController < ApplicationController
  
  before_filter :check_sign_in

  def index
    @user = current_user
    @lists = @user.lists.all
  end

  def new
    @user = current_user
    @list = @user.lists.new
  end

  def create
    @user = current_user
    @list = @user.lists.create(params[:list])
    if @list.save
      redirect_to lists_path
    else
      render :action => 'new'
    end
  end
end
