class AddSecretKeyToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :secret_key, :string, null: false
  end
end
