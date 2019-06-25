class ReportsController < ApplicationController
  def index
    if params[:is_filtered_tasks]
      task_report_respond
    elsif params[:is_filtered_user_tasks]
      user_report_respond
    elsif params[:is_filtered_project_tasks]
      project_report_respond
    end

    comment_count = ActiveRecord::Base.connection.execute("select posts.project_id, count(comments.id) from posts
                                                    inner join comments on posts.id = comments.post_id group by posts.project_id;")

    post_count = ActiveRecord::Base.connection.execute("select project_id, count(*) as p_count from posts group by project_id;")

    @statistics = []
    comment_count.each_with_index do |value, i| value
      stat = ProjectStatistics.new
      stat.comments_count = value["count"]
      stat.post_count = post_count[i]["p_count"]
      stat.project= value["project_id"]

      @statistics.push(stat)
    end
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
