class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
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
    @pet.update(pet_params)

    redirect_to pet_path(@pet)
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :price, :age, :species, :size, :description)
  end
end
