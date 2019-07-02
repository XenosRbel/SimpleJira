class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def edit
    @team = Team.find(params[:id])

    authorize! :edit, @team

    @user_list = User.all
  end

  def show
    @team = Team.find(params[:id])

    authorize! :show, @team

    @users = @team.users
  end

  def new
    @team = Team.new

    authorize! :new, @team

    @user_list = User.all
  end

  def create
    @team = Team.new(team_params)

    authorize! :create, @team

    if @team.save
      bind_user_to_team
      redirect_to @team
    else
      render 'new'
    end
  end

  def update
    @team = Team.find(params[:id])

    authorize! :update, @team

    if @team.update(team_params)
      bind_user_to_team
      redirect_to teams_path
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])

    authorize! :destroy, @team

    @team.destroy

    redirect_to teams_path
  end

  private

  def bind_user_to_team
    unless params[:team][:users].blank?
      @user = User.find(params[:team][:users])
      @user.team_id = params[:id]
      @user.save
    end
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
