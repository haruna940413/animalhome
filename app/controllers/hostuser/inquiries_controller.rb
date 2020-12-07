class Hostuser::InquiriesController < Hostuser::Base
  before_action :authenticate_hostuser!

  def index
    @inquiries = Inquiry.all.order("id DESC")
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update(inquiry_params)
      flash[:notice] = "返信済みに更新しました"
      redirect_back fallback_location:  @inquiry
    else
      @inquiries = Inquiry.all
      render :index
    end
  end

  def inquiry_params
    params.require(:inquiry).permit(:email, :message, :name, :reply_status)
  end

end
