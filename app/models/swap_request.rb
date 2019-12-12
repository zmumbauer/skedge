class SwapRequest < ApplicationRecord
  validates_presence_of :requesting_user_id, :timeperiod_id

  enum status: { submitted: 0, waiting_approval: 1, approved: 2 }
end
