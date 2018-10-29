# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_day, only: [:create, :destroy]
  respond_to :json
  def create
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
    byebug
    @day = Day.find(params[:day_id])
  end

  def task_params
    params.require(:task).permit(:list)
  end
end
