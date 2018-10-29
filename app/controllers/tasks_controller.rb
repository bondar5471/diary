class TasksController < ApplicationController
  before_action :find_day
  respond_to :json
  def create
    byebug
    @day.tasks.create(task_params)
    respond_to do |format|
      format.json { render json: @day.tasks.last }
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def find_day
    @day = Day.find(id: @day)
  end

  def task_params
    params.require(:task).permit(:list)
  end
end