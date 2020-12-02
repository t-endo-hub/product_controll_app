5.times do |n|
  Charge.create!(
    charge_name: "テスト担当者#{n + 1}",
  )
end

5.times do |n|
  Item.create!(
    item_name: "テストアイテム#{n + 1}",
  )
end