class Relationship < ActiveRecord::Base
  belongs_to :bad_match_1, foreign_key: :shipper_a_id, class_name: :User
  belongs_to :bad_match_2, foreign_key: :shipper_b_id, class_name: :User
  validates :bad_match_1, :bad_match_2, presence: true
  validate :complete_uniqueness

  def complete_uniqueness
    errors.add(:relationship, "already exists") if Relationship.find_by(shipper_a_id: self.shipper_b_id, shipper_b_id: self.shipper_a_id) || Relationship.find_by(shipper_a_id: self.shipper_a_id, shipper_b_id: self.shipper_b_id)
  end
end
