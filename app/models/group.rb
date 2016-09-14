class Group < ActiveRecord::Base
  has_many :groups_users
  has_many :users, through: :groups_users
  validates :name, :admin_id, presence: true
end
