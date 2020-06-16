class UsersController < ApplicationController
  before_action :set_user, only: [:show, :paid, :cancelled]

  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.status = :new

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def paid
    @user.update status: :paid
    redirect_to action: :show
  end

  def cancelled
    @user.update status: :cancelled
    redirect_to action: :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(session[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email, :name)
    end
end
