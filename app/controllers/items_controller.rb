class ItemsController < ApplicationController

	def create
		@list = List.find(params[:list_id])
		@item = @list.items.build(params[:item])
		if @item.save
			redirect_to lists_path
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to lists_path
	end

end
