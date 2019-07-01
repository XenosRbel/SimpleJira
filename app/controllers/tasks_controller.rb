class TasksController < ApplicationController
  def index
    if params[:person_id]
      @tasks = User.find(params[:person_id]).tasks
    elsif params[:status]
      @tasks = Task.where(status: params[:status])
    elsif params[:project_id]
      projects = Project.find(params[:project_id])

      users = projects.team.users

      @tasks = []
      users.each do |user|
        user.tasks.each do |task|
          @tasks.push(task)
        end
      end
    else
      @tasks = Task.all
    end

    authorize! :read, @tasks
  end

  def task_on_user
    if params[:user_id]
      @user = User.find(params[:user_id])
      @tasks = @user.tasks
    end
  end

  def edit
    @task = Task.find(params[:id])

    authorize! :edit, @tasks
  end

  def show
	  if params[:id]
      @task = Task.find(params[:id])
      @user = @task.user
	  end

    authorize! :show, @tasks
  end

  def new
    @task = Task.new

    authorize! :new, @tasks
  end

  def create
    @task = Task.new(task_params)

    authorize! :create, @task

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])

    authorize! :update, @task

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    authorize! :destroy, @tasks

    @task.destroy
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title,
                                   :content,
                                   :comments,
                                   :status,
                                   :start_date,
                                   :due_date,
                                   :estimation,
                                   :user_id,
                                   :project_id)
    end
end
