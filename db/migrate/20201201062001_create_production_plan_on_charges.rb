class CreateProductionPlanOnCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :production_plan_on_charges do |t|
      t.references :charge, foreign_key: true
      t.references :item, foreign_key: true
      t.date :start_date_of_week, presence: true
      t.integer :num, presence: true
      t.timestamps
    end
  end
end
