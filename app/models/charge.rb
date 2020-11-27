class Charge < ApplicationRecord
  validates :charge_name, presence: true,  length: { maximum: 20 }
end
