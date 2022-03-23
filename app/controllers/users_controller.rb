class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @games = @user.games
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  # userを退会させるためのdestroy
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
      redirect_to (current_user) unless @user == current_user
  end

  # 管理者かどうか確認
    def admin_user
      redirect_to(user_path) unless current_user.admin?
    end



end
