class Relationship < ActiveRecord::Base
  belongs_to :bad_match_1, foreign_key: :shipper_a_id, class_name: :User
  belongs_to :bad_match_2, foreign_key: :shipper_b_id, class_name: :User
  validates :shipper_a_id, :shipper_b_id, presence: true
end
