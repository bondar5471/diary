class DaysController < ApplicationController
	before_action :set_day, only: [:show, :edit, :update, :destroy]

	def index
    @days = Day.all
	end

	def show
	end

	def new
	  @day = Day.new
	end

	def create
	  @day = Day.new(day_params)
	  if @day.save
		flash[:success] = 'Day create.'
	    redirect_to days_path
	  else
	    render :new
	  end
	end

	def edit
	end
	
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
	
	private

	def set_day
	  @day = Day.find(params[:id])
	end

	def day_params
	  params.require(:day).permit(:date, :successful, :report)
	end
end
