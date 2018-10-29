class TasksController < ApplicationController
  before_action :find_day, only: [:destroy]
  respond_to :json
  def create
    byebug
    @day = Day.find(params[:day_id])
    @day.tasks.create(task_params)
    respond_to do |format|
      format.json { render json: @day.tasks.last }
    end
  end

  def destroy
    @task.destroy
  end

  private

  def find_day
    byebug
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:list)
  end
end
