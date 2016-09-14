class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :shipper_a_id, null: false
      t.integer :shipper_b_id, null: false

      t.timestamps null: false
    end
  end
end
