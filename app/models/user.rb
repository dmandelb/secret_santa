class User < ActiveRecord::Base
  has_secure_password
  belongs_to :group
  has_many :relationship_matchers, foreign_key: :shipper_a_id, class_name: "Relationship"
  has_many :bad_matchers, through: :relationship_matchers, source: :relationship_matcher
  has_many :relationship_matchees, foreign_key: :shipper_b_id, class_name: "Relationship"
  has_many :bad_matchees, through: :relationship_matchees, source: :relationship_matchee

  has_one :recipient, class_name: "User", foreign_key: :recipient_id
  belongs_to :giver, class_name: "User", foreign_key: :recipient_id
  validates :name, :email, presence: true

  # necessary if #bad_matchers and #bad_matchees do not both yield full results
  # def self.bad_matches
  #   self.bad_matchers + self.bad_matchees
  # end
end
