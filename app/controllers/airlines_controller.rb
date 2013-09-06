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
  	@title = 'Edit'
  	@airline = Airline.find(params[:id])
  	add_breadcrumb "Edit", edit_airline_path(@airline)
  end

  def create
  	@title = "Add new"
  	add_breadcrumb "Add new", new_airline_path
  	@airline = Airline.new(params[:airline])
  	if @airline.save
  		redirect_to edit_airline_url(@airline), notice: "Successfully create airline"
  	else
  		render action: 'new'
  	end
  end

  def update
  	@title = "Edit"
  	@airline = Airline.find(params[:id])
  	add_breadcrumb "Edit", edit_airline_path(@airline)
  	if @airline.update_attributes(params[:airline])
  		redirect_to edit_airline_url(@airline), notice: "Successfully update airline"
  	else
  		render action: "edit"
  	end
  end

  def destroy
  	@airline = Airline.find(params[:id])
  	if @airline.delete
  		redirect_to :back, notice: "Successfully delete airline"
  	else
  		flash[:error] = "Failed to delete airline"
  		redirect_to :back
  	end
  end

  private
  def index_path
  	airlines_path
  end
end
