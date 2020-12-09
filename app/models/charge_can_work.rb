class ChargeCanWork < ApplicationRecord
  belongs_to :item
  belongs_to :charge
  validates :time_required, presence: true
end
