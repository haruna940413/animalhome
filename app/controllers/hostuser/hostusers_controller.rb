class Hostuser::HostusersController < Hostuser::Base
 
 def index
  @endusers = Enduser.all
 end
 
end