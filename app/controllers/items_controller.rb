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
      redirect_to user_path current_user
    end
  end

  def destroy

    # @user = current_user
    # @item = @user.items.find(params[:id])

    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "The task was completed and removed."
    else
      flash[:alert] = "Failed to remove the task."
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
