class OrganizationToken < ApplicationRecord
  belongs_to :organization
  validates_presence_of :token, :organization_id, :email

  before_validation :generate_token_value

  def expire
    self.delete
  end

  def validate
    self.created_at = Time.now.utc > (self.created_at.utc + token_life)
  end

  private

  def generate_token_value
    self.token = SecureRandom.hex(20)
  end

  def token_life
    30.days
  end
end
