class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to tweets_path
      else
        render :new
      end
    end
  end

  def update
      if @user.update(user_params)
        redirect_to @user

      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
      redirect_to tweets_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:full_name, :username, :password, :email, :image)
    end
end
