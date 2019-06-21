class ReportsController < ApplicationController
  def index
    if params[:is_filtered_tasks]
      @tasks = Task.where(status: params[:status])
    elsif params[:is_filtered_user_tasks]
      @tasks = User.find(params[:user_id]).tasks
    elsif params[:is_filtered_project_tasks]
      projects = Project.find(params[:project_id])

      users = projects.team.users

      @tasks = []
      users.each do |user|
        user.tasks.each do |task|
          @tasks.push(task)
        end
      end
    end
  end
end
