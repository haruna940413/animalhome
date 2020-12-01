class Hostuser::HostuserHomesController < Hostuser::Base

  def top
    @reservations = Reservation.all
  end
end
