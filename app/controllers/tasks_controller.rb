# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_day
  respond_to :html, :js
  def create
    @day.tasks.create(task_params)
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