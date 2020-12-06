class Enduser::SearchController < Enduser::Base

  def search
    @words = params[:search]
    @pets = Pet.all

    @pets = @pets.where('name like ? or kind like ?',"%#{@words}%","%#{@words}%") if @words.present?

    @pets = @pets.where("age like ?", Pet.ages[params[:age]]) if params[:age].present? && params[:age] != 'blank'

    @pets = @pets.where("sex like ?", Pet.sexes[params[:sex]]) if params[:sex].present? && params[:sex] != 'blank'

    @pets = @pets.where("size like ?", Pet.sizes[params[:size]]) if params[:size].present? && params[:size] != 'blank'

    @pets = @pets.where("vaccine_status like ?", Pet.vaccine_statuses[params[:vaccine_status]]) if params[:vaccine_status].present? && params[:vaccine_status] != 'blank'

    @pets = @pets.where("castration_status like ?", Pet.castration_statuses[params[:castration_status]]) if params[:castration_status].present? && params[:castration_status] != 'blank'

    @pets = @pets.where("single_status like ?", Pet.single_statuses[params[:single_status]]) if params[:single_status].present? && params[:single_status] != 'blank'

    @pets = @pets.where("older_status like ?", Pet.older_statuses[params[:older_status]]) if params[:older_status].present? && params[:older_status] != 'blank'

    @pets = @pets.where("prefectures like ?", Pet.prefectures[params[:prefectures]]) if params[:prefectures].present? && params[:prefectures] != 'blank'


    @words = []
    @words << params[:search] << Pet.ages_i18n[params[:age]] << Pet.sexes_i18n[params[:sex]] << Pet.sizes_i18n[params[:size]] << Pet.vaccine_statuses_i18n[params[:vaccine_status]] << Pet.castration_statuses_i18n[params[:castration_status]] << Pet.single_statuses_i18n[params[:single_status]] << Pet.older_statuses_i18n[params[:older_status]] << Pet.prefectures_i18n[params[:prefectures]]
    @words.delete('--入力してください--')
  end
end
