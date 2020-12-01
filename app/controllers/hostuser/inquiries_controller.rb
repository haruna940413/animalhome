class Hostuser::InquiriesController < Hostuser::Base

  def index
    @inquiries = Inquiry.all
  end

  def show
    @inquirie = Inquiry.find(params[:id])
  end
end
