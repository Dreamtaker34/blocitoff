class UsersController < ApplicationController

  def index
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
      if !policy(@user).show?
      # if @user != current_user
        flash[:error] = "can't view this user's profile"
        redirect_to root_path
      end
    else
      @user = current_user
    end

    @item = Item.new
    @items = @user.items.all
  end
end
