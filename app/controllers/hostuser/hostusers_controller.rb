class Hostuser::HostusersController < Hostuser::Base
 before_action :authenticate_hostuser!
 def index
  @endusers = Enduser.all
 end

end