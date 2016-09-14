class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users do |t|
      t.references :groups, null: false
      t.references :users, null: false

      t.timestamps null: false
    end
  end
end
