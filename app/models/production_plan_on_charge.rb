class ProductionPlanOnCharge < ApplicationRecord
  belongs_to :charge
  belongs_to :item
end
