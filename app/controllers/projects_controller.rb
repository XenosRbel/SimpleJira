class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    @teams_involved = ActiveRecord::Base.connection.execute('select distinct
    team_id, teams.name from projects
    inner join teams on projects.team_id = teams.id;').as_json

    @project_where_user_havnt_task = ActiveRecord::Base.connection.execute('select * from (
               select projects.id from projects
                                 inner join teams on projects.team_id = teams.id
                                 inner join users on teams.id = users.team_id
                                 left join tasks on users.id = tasks.user_id
               where tasks.user_id is null
    ) as t
    group by t.id').as_json

    @c_projects_with_task = ActiveRecord::Base.connection.execute('select projects.name, projects.start_date, count(tasks.id) as task_count from projects
      inner join teams on projects.team_id = teams.id
      inner join users on teams.id = users.team_id
      inner join tasks on users.id = tasks.user_id
    group by projects.id
    having count(tasks.id) > 0
    order by task_count desc, projects.start_date;').as_json
  end

  def edit
    @project = Project.find(params[:id])
    @task_list = Task.all
  end

  def show
    @project = Project.find(params[:id])
    @team = @project.team
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
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
