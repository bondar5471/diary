class TasksController < ApplicationController

	def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:success] = " successfully created"
      redirect_to @task
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

	def destroy
		@task = Task.find(params[:id])
		if @task.destroy
			flash[:success] = 'Object was successfully deleted.'
			redirect_to tasks_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to tasks_path
		end
	end
	

end