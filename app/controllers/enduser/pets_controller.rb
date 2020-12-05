class Enduser::PetsController < Enduser::Base
  before_action :authenticate_enduser!, only: [:show]

  def index
    @pets = Pet.where(pet_status: "invite" )
    @genres = Genre.where(valid_flag: false )
  end

  def show
    @pet = Pet.find(params[:id])
  end
  
end
