class CreateChargeCanWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :charge_can_works do |t|
      t.references :charge
      t.references :item
      t.float :time_required
      t.timestamps
    end
  end
end
