class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :shipper_id, null: false
      t.integer :shippee_id, null: false

      t.timestamps null: false
    end
  end
end
