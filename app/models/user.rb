class User < ActiveRecord::Base
  has_secure_password
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :relationship_matchers, foreign_key: :shipper_a_id, class_name: "Relationship"
  has_many :bad_matchers, through: :relationship_matchers, source: :bad_match_2
  has_many :relationship_matchees, foreign_key: :shipper_b_id, class_name: "Relationship"
  has_many :bad_matchees, through: :relationship_matchees, source: :bad_match_1

  has_one :giver, class_name: "User", foreign_key: :recipient_id
  belongs_to :recipient, class_name: "User", foreign_key: :recipient_id
  validates :name, :email, presence: true
  # validates :recipient, uniqueness: {scope: :groups}


  def bad_matches
    self.bad_matchers + self.bad_matchees
  end
end


