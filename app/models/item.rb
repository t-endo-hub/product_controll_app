class Item < ApplicationRecord
  has_many :charge_can_works
  has_many :production_plan_on_charges, dependent: :destroy
  validates :name, presence: true,  length: { maximum: 20 }
end
