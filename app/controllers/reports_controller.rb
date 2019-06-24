class ReportsController < ApplicationController
  def index
    if params[:is_filtered_tasks]
      task_report_respond
    elsif params[:is_filtered_user_tasks]
      user_report_respond
    elsif params[:is_filtered_project_tasks]
      project_report_respond
    end

    # results = ActiveRecord::Base.connection.execute("")
    # result = results.as_json
    # @result = result
  end

  private
  def task_report_respond
    @tasks = Task.where(status: params[:status])

    ajax_respond('task_report')
  end

  def user_report_respond
    @tasks = User.find(params[:user_id]).tasks

    ajax_respond('user_report')
  end

  def project_report_respond
    projects = Project.find(params[:project_id])

    users = projects.team.users

    @tasks = []
    users.each do |user|

      user.tasks.each do |task|
        @tasks.push(task)
      end
    end

    ajax_respond('project_report')
  end

  def ajax_respond(js_script)
    respond_to do |format|
      format.html { render(text: 'not implemented') }
      format.js { render js_script }
    end
  end
end
