# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_day
  before_action :find_task, only: [:destroy]
  respond_to :json
  def create
    @day.tasks.create(task_params)
  end

  def destroy
    @task.destroy
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def find_day
    @day = Day.find(params[:day_id])
  end

  def task_params
    byebug
    params.require(:task).permit(:day_id, :list)
  end
end
