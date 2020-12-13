class Hostuser::PetsController < Hostuser::Base
  before_action :authenticate_hostuser!

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
    @genres = Genre.all
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      flash[:notice] = "登録が出来ました"
      redirect_to hostuser_pet_path(@pet.id)
    else
      @genres = Genre.all
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
    @genres = Genre.all
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      flash[:notice] = "商品情報を更新しました"
      redirect_to hostuser_pet_path(@pet.id)
    else
      @genres = Genre.all
      render :edit
    end
  end

  private
  def pet_params
    params.require(:pet).permit(:genre_id, :name, :kind, :age, :sex, :size, :animal_image, :vaccine_status, :castration_status,
                                :single_status, :older_status, :pet_status, :prefectures, :detail)
  end

end