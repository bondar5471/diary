# frozen_string_literal: true

class TasksController < ApplicationController
before_action :find_day
  def create
    @task = @day.tasks.create(task_params)
    if @task.save
      flash[:success] = "Successfully created"
      redirect_to @day
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def destroy
  @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to @day
    else
      flash[:error] = 'Something went wrong'
      redirect_to @day
    end
  end
  
  private

  def find_day
    @day = Day.find(params[:day_id])
  end

  def task_params
    params.require(:task).permit(:list)
  end
end
