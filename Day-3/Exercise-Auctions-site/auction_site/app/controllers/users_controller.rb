class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @users_count = @users.count
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
  end

  def new
    @user = User.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,
                                   :email)
    end
end
