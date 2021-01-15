class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy]
  # before_action :if_user_exists, only: %i[show]
  before_action :check_owner, only: %i[update destroy show]

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render json: UserSerializer.new(@user).serializable_hash, status: :ok
    else
      head :no_content
    end
  end

  def index
    render json: User.all, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user).serializable_hash, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serializable_hash, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role_id, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def if_user_exists
    @user = User.exists?(params[:id])
  end

  def check_owner
    if current_user.nil? 
      head :forbidden 
    else 
      head :forbidden unless params[:id].to_i == current_user&.id.to_i
    end
  end
end
