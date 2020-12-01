class Charge < ApplicationRecord
  has_many :charge_can_work
  has_many :production_plan_on_charges, dependent: :destroy
  validates :charge_name, presence: true,  length: { maximum: 20 }
end
