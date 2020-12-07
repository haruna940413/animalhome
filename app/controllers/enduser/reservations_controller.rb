class Enduser::ReservationsController < Enduser::Base
  before_action :authenticate_enduser! , only: [:create, :show, :update, :destroy]

  def index
    @reservations = Reservation.all
    @reservation = Reservation.new
  end


  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.enduser_id = current_enduser.id
    if @reservation.save
      flash[:notice] = "予約しました"
      redirect_to enduser_reservation_path(@reservation.id)
    else
      @reservations = Reservation.all
      render "index"
      flash[:notice] = "予約に失敗しました"
    end
  end

  def show
    @reservations = Reservation.all
    @reservation = Reservation.find(params[:id])
  end


  def update
    @reservation = Reservation.find(params[:id])

    if  @reservation.update(reservation_params)
      flash[:notice] = "予約更新しました"
      redirect_to enduser_reservations_path
    else
      render "edit"
      flash[:notice] = "予約の更新に失敗しました"
    end
  end


  def destroy
    @reservation = Reservation.find_by(id: params[:id], enduser_id: current_enduser.id)
    @reservation.destroy
    redirect_to enduser_reservations_path
  end

private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
