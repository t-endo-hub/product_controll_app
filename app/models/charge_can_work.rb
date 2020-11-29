class ChargeCanWork < ApplicationRecord
  belongs_to :Charge
  belongs_to :Item
  validates :time_required, presence: true
end
