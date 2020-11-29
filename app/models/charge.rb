class Charge < ApplicationRecord
  has_many :items, through: :charge_can_works
  has_many :charge_can_works
  validates :charge_name, presence: true,  length: { maximum: 20 }
end
