class Item < ApplicationRecord
  has_many :users, through: :charge_can_works
  has_many :charge_can_works
  validates :name, presence: true,  length: { maximum: 20 }
end
