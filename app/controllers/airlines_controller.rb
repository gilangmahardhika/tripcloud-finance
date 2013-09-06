class AirlinesController < ApplicationController
	helper_method :index_path
	add_breadcrumb "Airline", :index_path
  def index
  	@airlines = Airline.order{[name.asc]}.page(params[:page]).per(10)
  	@title = "Airline"
  end

  def new
  	@airline = Airline.new
  	@title = "Add Airline"
  	add_breadcrumb "Add new", new_airline_path
  end

  def edit
  end

  private
  def index_path
  	airlines_path
  end
end
