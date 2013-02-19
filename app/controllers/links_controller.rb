class LinksController < ApplicationController
  
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      redirect_to root_url, :notice => "Successfully created link."
    else
      render :action => 'new'
    end
  end
end
