class TrainingSession < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  validates :date, presence: true
  validates :time, presence: true
  validates :status, inclusion: { in: %w[available booked] }

  scope :available, -> { where(status: 'available') }
end
