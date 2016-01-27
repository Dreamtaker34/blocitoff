class UsersController < ApplicationController
  def index
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
      if @user == current_user
      else
        redirect_to root_path
      end
    else
      @user = current_user
    end

    @item = Item.new
    @items = @user.items.all
  end
end
