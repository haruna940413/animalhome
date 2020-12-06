class Hostuser::HostuserHomesController < Hostuser::Base
  before_action :authenticate_hostuser!

  def top
    @reservations = Reservation.all
  end
end
