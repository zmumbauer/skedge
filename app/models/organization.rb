class Organization < ApplicationRecord
  has_many :users

  validates :name, presence: true, length: { minimum: 2, maximum: 150 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :logo, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
end
