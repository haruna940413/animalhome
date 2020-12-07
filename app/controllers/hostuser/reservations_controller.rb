class Hostuser::ReservationsController < Hostuser::Base
  before_action :authenticate_hostuser!

  def index
    @reservations = Reservation.all
  end

end