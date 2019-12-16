class Organization < ApplicationRecord
  has_many :members, foreign_key: :organization_id, class_name: 'User'
  has_many :timeperiods, through: :members
  has_many :swap_requests

  validates :name, presence: true, length: { minimum: 2, maximum: 150 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" },
                          length: { minimum: 5, maximum: 15 }, presence: true
end
