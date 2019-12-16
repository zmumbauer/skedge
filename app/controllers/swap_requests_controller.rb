class SwapRequestsController < ApplicationController
  before_action :get_swap_request, only: [ :show, :update, :claim_shift, :approve, :deny ]
  access user: [ :index, :show, :claim_shift, :create ], business_manager: :all

  def show
  end

  def index
    if logged_in?(:business_manager)
      @swap_requests = current_organization.swap_requests
    else
      @swap_requests = SwapRequest.submitted
    end
  end

  def create
    @swap_request = current_organization.swap_requests.new(swap_request_params)
    @swap_request.requesting_user_id = current_user.id
    

    if @swap_request.save!
      redirect_to swap_requests_path, success: "Swap request submitted"
    else
      redirect_to timeperiod_path(Timeperiod.find(@swap_request.timeperiod_id))
    end
  end

  def claim_shift
    if @swap_request.update(fulfilling_user_id: current_user.id, status: 1)
      redirect_to swap_request_path(@swap_request), success: "You have claimed this shift"
    else  
      redirect_to swap_request_path(@swap_request), danger: "Could not claim shift"
    end
  end

  def approve
    @shift = Timeperiod.find(@swap_request.timeperiod_id)
    if @shift.update(user_id: @swap_request.fulfilling_user_id)
      @swap_request.delete
      begin
        MemberMailer.swap_approved(@swap_request).deliver
      rescue
        redirect_to timeperiod_path(@shift), danger: "Email could not be sent"
      end
      redirect_to timeperiod_path(@shift), success: "Swap was approved"
    else
      redirect_to swap_request_path(@swap_request), danger: "Could not approve swap"
    end
  end

  private

  def get_swap_request
    @swap_request = SwapRequest.find(params[:id])
  end

  def swap_request_params
    params.require(:swap_request).permit(:timeperiod_id)
  end
end