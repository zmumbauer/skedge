class OrganizationToken < ApplicationRecord
  belongs_to :organization
  validates_presence_of :token, :organization_id, :email

  validate :unique_email, on: :create

  before_validation :generate_token_value

  def expire
    self.delete
  end

  def is_valid?
    self.created_at = Time.now.utc > (self.created_at.utc + token_life)
  end

  def unique_email
    if Organization.find(self.organization_id).members.find_by_email(self.email)
      errors.add(:email, "is invalid")
    end
  end

  private

  def generate_token_value
    self.token = SecureRandom.hex(20)
  end

  def token_life
    7.days
  end
end
