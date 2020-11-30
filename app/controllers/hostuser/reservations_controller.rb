class Hostuser::ReservationsController < Hostuser::Base

 def index
   @reservations = Reservation.all
 end

end