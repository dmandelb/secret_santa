class User < ActiveRecord::Base
  has_secure_password
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :relationship_matchers, foreign_key: :shipper_a_id, class_name: "Relationship"
  has_many :bad_matchers, through: :relationship_matchers, source: :bad_match_2
  has_many :relationship_matchees, foreign_key: :shipper_b_id, class_name: "Relationship"
  has_many :bad_matchees, through: :relationship_matchees, source: :bad_match_1

  has_many :groups_givers, foreign_key: :recipient_id, class_name: "GroupsUser"

  has_many :recipients, through: :groups_users, source: :user_recipient
  has_many :givers, through: :groups_givers, source: :user_giver
  validates :name, :email, presence: true
  # validates :recipient, uniqueness: {scope: :groups}


  def bad_matches
    self.bad_matchers + self.bad_matchees
  end
end


