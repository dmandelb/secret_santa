class Relationship < ActiveRecord::Base
  belongs_to :bad_match_1, foreign_key: :shipper_a_id, class_name: :user
  belongs_to :bad_match_2, foreign_key: :shipper_b_id, class_name: :user
end
