class SwapRequest < ApplicationRecord
  validates_presence_of :requesting_user_id, :timeperiod_id

  enum status: { submitted: 0, waiting_approval: 1, approved: 2 }

  # Define pick-up-shift method
  def pickup_shift(receiving_user_id)
    self.fulfilling_user_id = receiving_user_id
    self.status = 1
    self.save
  end

  def approve_swap
    @timeperiod = Timeperiod.find(self.timeperiod_id)
    @timeperiod.user_id = self.fulfilling_user_id
    @timeperiod.save

    self.status = 2
    self.save
  end
end
