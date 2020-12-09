class ProductionActOnCharge < ApplicationRecord
  belongs_to :item
  belongs_to :charge
  validates :num, presence: true
  validates :start_date_of_week, presence: true
end
