class TasksController < ApplicationController
  def index
    @tasks = Task.all

    authorize! :read, @tasks
  end

  def edit
    @task = Task.find(params[:id])

    authorize! :edit, @tasks
  end

  def show
    @task = Task.find(params[:id])
    @user = @task.user

    authorize! :show, @tasks
  end

  def new
    @task = Task.new

    authorize! :new, @tasks
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])

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
                                   :created_at,
                                   :updated_at,
                                   :user_id)
    end
end
