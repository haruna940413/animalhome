class Enduser::ReservationsController < Enduser::Base
  before_action :authenticate_enduser_enduser!
  before_action :set_pet, only: [:new, :create, :edit, :update]

  def new
    @newreservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    p @reservation
    @reservation.enduser_id = current_enduser_enduser.id
    @reservation.save
    flash[:notice] = "予約しました"
    redirect_to "/"
  end

private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :pet_id)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

end
