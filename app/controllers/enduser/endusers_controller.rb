class Enduser::EndusersController < Enduser::Base
  before_action :authenticate_enduser! , only: [:edit, :update]

  def show
    @enduser = Enduser.find(params[:id])
    @posts = @enduser.posts
    @reservation = Reservation.where(enduser_id: current_enduser)
  end

  def edit
    @enduser = current_enduser
  end

  def update
    @enduser = current_enduser

    if @enduser.update(enduser_params)
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to
    else
      @enduser = current_enduser
      render "edit"
    end
  end

  private
  def enduser_params
    params.require(:enduser).permit(:name, :email, :profile_image,:introduction)
  end

end
