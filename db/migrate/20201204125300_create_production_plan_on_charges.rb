class CreateProductionPlanOnCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :production_plan_on_charges do |t|
      t.references  :charge
      t.references  :item
      t.date :start_date_of_week
      t.integer :num
      t.timestamps
    end
  end
end
