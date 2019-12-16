class Timeperiod < ApplicationRecord
  belongs_to :user
  has_many :organization, through: :user

  enum kind: { unavailable: 0, template: 1, shift: 2 }

  enum status: { inactive: 0, active: 1 }

  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :date_is_correct?, on: :create

  private

  def date_is_correct?
    if self.start_time.respond_to?(:strftime) && self.end_time.respond_to?(:strftime)
      unless self.start_time.to_date.future?
        errors.add(:start_time, "must be in the future")
      else
        unless self.start_time.before?(self.end_time)
          errors.add(:start_time, "cannot take place after end time")
        end
      end
    else
      errors.add(:start_time, "must be a date")
      errors.add(:end_time, "must be a date")
    end
  end
end
