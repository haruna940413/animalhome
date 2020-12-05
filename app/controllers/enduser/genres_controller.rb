class Enduser::GenresController < Enduser::Base
  
  def show
    @genre = Genre.find(params[:id])
  end
end