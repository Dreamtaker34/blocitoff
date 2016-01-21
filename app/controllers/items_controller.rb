class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    # raise
    @user = current_user
    @item = Item.create
    @item.user = current_user
    @item.assign_attributes(item_params)

    if @item.save
      flash[:notice] = "Your to-do was saved."
      redirect_to user_path @user
    else
      flash[:alert] = "Couldn't save your to-do, please try again."
      redirect_to user_show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
