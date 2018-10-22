# frozen_string_literal: true

class DaysController < ApplicationController
  before_action :set_day, only: %i[show edit update destroy]
  #before_action :authenticate_user!
  def index
    @days = Day.all
  end

  def show; end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      flash[:success] = 'Day create.'
      redirect_to days_path
    else
      flash[:success] = 'Date and Report must be filled.'
      render :new
    end
  end

  def edit; end

  def update
    if @day.update(day_params)
      flash[:success] = 'Day update.'
      redirect_to @day
    else
      render :edit
    end
  end

  def destroy
    if @day.destroy
      flash[:success] = 'Day deleted.'
      redirect_to days_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to days_url
    end
  end

  def create_task
    @task = Task.new(task_params)
    if @task.save
      redirect_to days_path
    else
      render :new
    end
  end

  def destroy_task
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:successful] = 'Task on day detete'
      redirect_to days_url
    else
      flash[:error] = 'Something wen wrong'
      redirect_to days_url
    end
  end

  private

  def task_params
    params.require(:task).permit(:list)
  end

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.require(:day).permit(:date, :successful, :report)
  end
end
