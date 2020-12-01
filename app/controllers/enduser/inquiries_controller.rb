class Enduser::InquiriesController < Enduser::Base

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to enduser_inquiry_path(@inquiry)
    else
      render :new
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:email, :message, :name, :reply_status)
  end

end
