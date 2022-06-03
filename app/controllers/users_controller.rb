class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  # for admin (super-user) only
  def index
    @users = User.all
  end

  # for sign-up
  def new
  # @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  # User view his only own profile.
  # May have to use "if" statement to prevent user from accessing other user's profile.
  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  # only the user can delete his account. if statement is a MUST
  def destroy
    @user.destroy
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :address, :phone, :password, :password_confirmation, :remember_me)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
