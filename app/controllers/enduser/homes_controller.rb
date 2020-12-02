class Enduser::HomesController < Enduser::Base
  
  def top
    @pets = Pet.where(pet_status: "invite" )
  end

  def about
  end

  def guide
  end
  
  
end
