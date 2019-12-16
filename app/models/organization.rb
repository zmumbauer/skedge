class Organization < ApplicationRecord
  has_many :members, foreign_key: :organization_id, class_name: 'User'
  has_many :timeperiods, through: :members

  validates :name, presence: true, length: { minimum: 2, maximum: 150 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :logo, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
end
