class TasksController < ApplicationController
  before_action :find_day, only: [:create, :destroy]
  respond_to :json
  def create
    byebug
    @task = @day.tasks.create(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def find_day
    @day = Day.find(params[:day_id])
    
  end

  def task_params
    params.require(:task).permit(:list)
  end
end