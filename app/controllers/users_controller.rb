class UsersController < ApplicationController
  def index
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end

    @item = Item.new
    @items = @user.items.all
  end
end
