class Group < ActiveRecord::Base
  has_many :groups_users
  has_many :users, through: :groups_users
  belongs_to :admin, class_name: "User"
  validates :name, :admin, presence: true
  before_create :create_secret_key

  def match_up
    begin
    targets = users.dup.to_a.shuffle
    pre_paired = targets.zip(targets.rotate)
    paired = pre_paired.map { |person_pair|  match_pair(person_pair)}
    end while any_bad_matches?(paired)
    # will run infinitely if no possible good configuration
    paired.each {|person| person.save!}
  end

  private

  def match_pair(array)
    person_a = array[0]
    person_b = array[1]
    person_a.recipient = person_b
    person_a
  end

  def any_bad_matches?(match_array)#want to pass in array, not use associations, because objects not saved yet
    match_array.any?{|person| person.bad_matches.include?(person.recipient)}
  end

  def create_secret_key
    self.secret_key = SecureRandom.hex(8)
  end
end
