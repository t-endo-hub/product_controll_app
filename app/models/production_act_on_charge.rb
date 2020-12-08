class ProductionActOnCharge < ApplicationRecord
  belongs_to :item
  belongs_to :charge
end
