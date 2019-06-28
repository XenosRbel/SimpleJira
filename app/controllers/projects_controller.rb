class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    @teams_involved = ActiveRecord::Base.connection.execute('select distinct
    team_id, teams.name from projects
    inner join teams on projects.team_id = teams.id;').as_json

    project_where_user_havnt_task = ActiveRecord::Base.connection.execute('select * from (
               select projects.id from projects
                                 inner join teams on projects.team_id = teams.id
                                 inner join users on teams.id = users.team_id
                                 left join tasks on users.id = tasks.user_id
               where tasks.user_id is null
    ) as t
    group by t.id').as_json

    @project_where_user_havnt_task = []
    project_where_user_havnt_task.each do |value|
      @project_where_user_havnt_task.push(Project.find(value['id']).name)
    end

    @c_projects_with_task = ActiveRecord::Base.connection.execute('select projects.name, projects.start_date, count(tasks.id) as task_count from projects
      inner join teams on projects.team_id = teams.id
      inner join users on teams.id = users.team_id
      inner join tasks on users.id = tasks.user_id
    group by projects.id
    having count(tasks.id) > 0
    order by task_count desc, projects.start_date;').as_json.size

    authorize! :read, @projects
  end

  def edit
    @project = Project.find(params[:id])

    authorize! :edit, @project

    @task_list = Task.all
  end

  def show
    @project = Project.find(params[:id])

    authorize! :show, @project

    @team = @project.team
    @tasks = @project.tasks
  end

  def new
    @project = Project.new

    authorize! :new, @project
  end

  def create
    @project = Project.new(project_params)

    authorize! :create, @project

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    authorize! :update, @project

    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])

    authorize! :destroy, @project

    @project.destroy

    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name,
                                    :summary,
                                    :start_date,
                                    :end_date,
                                    :team_id)
  end
end
