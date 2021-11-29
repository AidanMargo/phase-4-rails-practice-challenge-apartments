class ApartmentsController < ApplicationController

  def index
    apartments = Apartment.all 
    render json: apartments
  end

  def show 
    apartment = Apartment.find(params[:id])
    if apartment.valid?
      render json: apartment
    else
      render json: {error: apartment.errors.full_messages}, status: :not_found
    end
  end

  def create
    apartment = Apartment.create(apartment_params)
    if apartment.valid?
      render json: apartment, status: :created
    else 
      render json: {error: apartment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    apartment = Apartment.find(params[:id])
    if apartment.valid?
      apartment.destroy
      head :no_content
    else
      render json: {error: "Apartment not Found"}, status: :not_found
    end
  end


  private

  def apartment_params
    params.permit(:number)
  end


end
