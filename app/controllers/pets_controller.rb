class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pets = policy_scope(Pet)
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
    @booking = Booking.new
    @markers =
      [{
        lat: @pet.latitude,
        lng: @pet.longitude
      }]
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_path(@pet), notice: "Successfully created Pet" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.update(pet_params)

    redirect_to pet_path(@pet)
  end

  def destroy
    authorize @pet
    @pet = Pet.find(params[:id])
    @pet.destroy

    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :price, :age, :species, :size, :description, :address, :photo)
  end
end
