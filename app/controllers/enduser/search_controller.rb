class Enduser::SearchController < Enduser::Base
  
  def search
    @word = params[:search]
    @pets = Pet.where('name like ? or kind like ? or sex like ? or size like ?',"%#{@word}%","%#{@word}%","%#{@word}%","%#{@word}%")
    @pets = @pets
  end
  
  
  
end