class Enduser::SearchController < Enduser::Base

  def search
    @word = params[:search]

    if params[:search].present?
      @pets = Pet.where('name like ? or kind like ?',"%#{@word}%","%#{@word}%")
    end

    if params[:age].present?
      @pets = Pet.where("age like ?", params[:age])
    end

    if params[:sex].present?
      @pets = Pet.where("sex like ?", params[:sex])
    end

    if params[:size].present?
      @pets = Pet.where("size like ?", params[:size])
    end

    if params[:vaccine_status].present?
      @pets = Pet.where("vaccine_status like ?", params[:vaccine_status])
    end

    if params[:castration_status].present?
      @pets = Pet.where("castration_status like ?", params[:castration_status])
    end

    if params[:single_status].present?
      @pets = Pet.where("single_status like ?", params[:single_status])
    end

    if params[:older_status].present?
      @pets = Pet.where("older_status like ?", params[:older_status])
    end
    
    if params[:prefectures].present?
      @pets = Pet.where("prefectures like ?", params[:prefectures])
    end


    @pets = @pets
  end
#@pets = Pet.where('name like ? or kind like ? or sex like ? or age like ? or size like ?',"%#{@word}%","%#{@word}%","%#{@word}%","%#{@word}%","%#{@word}%")
end
