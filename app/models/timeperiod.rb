class Timeperiod < ApplicationRecord
  belongs_to :user

  enum kind: { unavailable: 0, template: 1, shift: 2 }

  enum status: { inactive: 0, active: 1 }

  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :date_is_correct?, on: :create

  private

  def date_is_correct?
    if self.start_time.is_a?(DateTime) && self.end_time.is_a?(DateTime)
      unless self.start_time > Time.now
        errors.add(:start_time, :blank, "must be in the future")
        errors.add(:end_time, :blank, "must be in the future")
      end
    else
      errors.add(:start_time, :blank, "must be a date")
      errors.add(:end_time, :blank, "must be a date")
    end
  end
end
