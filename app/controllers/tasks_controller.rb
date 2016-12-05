class TasksController < ApplicationController
  def index
  	@task = Task.new
  	@todo = Task.where(complete: false).order(id: :desc)
  	@completed_tasks = Task.where(complete: true).order(id: :desc)
  end

  def create
		@task = Task.create(task_param)
		@task.completed = false
		@task.save
		redirect_to root_path
	end

private
	def task_param
		params.require(:task).permit(:title)
	end
end
