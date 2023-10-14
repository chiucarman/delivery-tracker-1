class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.integer :recipient_id
      t.string :description
      t.date :arrival_date
      t.string :details
      t.boolean :delivery_status

      t.timestamps
    end
  end
end
