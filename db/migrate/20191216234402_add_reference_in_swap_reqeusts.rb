class AddReferenceInSwapReqeusts < ActiveRecord::Migration[6.0]
  def change
    add_reference :swap_requests, :organization, index: true
  end
end
