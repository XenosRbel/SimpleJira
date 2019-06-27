class PersonsController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])

    if current_user.id != @user.id
      authorize! :edit, @user
    end
  end

  def show
    @user = User.find(params[:id])

    authorize! :read, @user
  end

  def new
    @user = User.new

    authorize! :new, @user
  end

  def create
    @user = User.new(user_params)

    authorize! :create, @user

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to persons_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to home_index_path
  end

  private
  def user_params
    params.require(:user).permit(:admin, :first_name, :last_name, :email)
  end
end
