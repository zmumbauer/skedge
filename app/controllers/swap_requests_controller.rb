class SwapRequestsController < ApplicationController


  def show

  end

  def index
    if logged_in?(:business_manager)
      @swap_requests = SwapRequest.all
    else
      @swap_requests = SwapRequest.submitted
    end
  end

  def create
    byebug
    @swap_request = SwapRequest.new(swap_request_params)
    @swap_request.requesting_user_id = current_user.id
    

    if @swap_request.save
      redirect_to swap_requests_path, success: "Swap request submitted"
    else
      redirect_to timeperiod_path()
    end
  end

  private

  def swap_request_params
    params.require(:swap_request).permit(:timeperiod_id)
  end
end