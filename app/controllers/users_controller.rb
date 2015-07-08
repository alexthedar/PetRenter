class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="Updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :phone)
  end
end