class PlantsController < ApplicationController
    # GET 

  def index
    plants = Plant.limit(2)
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  # POST plants/params
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  private 

  def plant_params
    params.permit(:name, :image, :price)
  end
end
