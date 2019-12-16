class TimeperiodsController < ApplicationController

  def new
    @timeperiod = Timeperiod.new
  end

  def create
    @timeperiod = Timeperiod.new(timeperiod_params)
    if @timeperiod.save
      redirect_to timeperiods_path, success: "Shift successfully created"
    else
      render 'new', danger: "Timeperiod could not be created."
    end

  end

  def index
    if logged_in?(:business_manager)
      @timeperiods = current_user.organization.timeperiods
    else
      @timeperiods = current_user.timeperiods
    end
  end

  def show
    @timeperiod = Timeperiod.find(params[:id])
    @swap_request = SwapRequest.new
  end

  private

  def timeperiod_params
    params.require(:timeperiod).permit(:start_time, :end_time, :user_id, :kind)
  end

end