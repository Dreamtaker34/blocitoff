class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.user = params[:item][:user_id]
    @item.name = params[:item][:name]

    if @item.save
      flash[:notice] = "Your to-do was saved."
      redirect_to user_path
    else
      flash[:alert] = "Couldn't save your to-do, please try again."
      redirect_to user_show
    end
  end
end
