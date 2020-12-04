class Charge < ApplicationRecord
  has_many :items, through: :charge_can_works, through: :production_plan_on_charges
  has_many :charge_can_works
  has_many :production_plan_on_charges, dependent: :destroy
  validates :charge_name, presence: true,  length: { maximum: 20 }
end
