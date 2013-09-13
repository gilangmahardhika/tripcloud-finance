class CitiesController < ApplicationController
	helper_method :index_path
	add_breadcrumb "City", :index_path
  def index
  	@cities = City.order{[name.asc]}
  	@title = "Cities"
  end

  def new
  	add_breadcrumb "Add city", new_city_path
  	@title = "Add city"
  	@city = City.new
  end

  def edit
  	@title = "Edit"
  	@city = City.find(params[:id])
  	add_breadcrumb "Edit city", edit_city_path(@city)
  end

  def show
  	@city = City.find(params[:id])
  end

  def create
  	add_breadcrumb "Add city", new_city_path
  	@title = "Add city"
  	@city = City.new(params[:city])
  	if @city.save
  		redirect_to cities_url, notice: "Successfully create city"
  	else
  		render action: "new"
  	end
  end

  def update
  	@title = "Edit"
  	@city = City.find(params[:id])
  	add_breadcrumb "Edit city", edit_city_path(@city)
  	if @city.update_attributes(params[:city])
  		redirect_to edit_city_url(@city), notice: "Successfully update city"
  	else
  		render action: "edit"
  	end
  end

  def destroy
  	@city = City.find(params[:id])
  	if @city.destroy
  		redirect_to :back, notice: "Successfully delete city"
  	else
  		flash[:error] = "Failed to delete city"
  		redirect_to :back
  	end
  end

  private
  def index_path
  	cities_path
  end
end
