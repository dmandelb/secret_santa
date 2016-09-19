class GroupsUser < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  validates :group, :user, presence: true
  belongs_to :user_giver, {class_name: :User, foreign_key: :user_id}
  belongs_to :user_recipient, {class_name: :User, foreign_key: :recipient_id}
end
