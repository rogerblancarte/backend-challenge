class Friendship < ApplicationRecord
  belongs_to :member, :foreign_key => :friend_id

  # Create both sides of a friendship (member <- friends -> member) by taking
  # advantage of the foreign key and has_many relationships on the Member model
  #
  # Example: Friendship.create(member_id: 1, friend_id: 2) will create a second
  # Friendship record with those values swapped

  after_create do |f|
    if !Friendship.find_by(friend_id: f.member_id)
      Friendship.create!(member_id:  f.friend_id, friend_id: f.member_id)
    end
  end


  # Destroy both sides of the friendship at once
  after_destroy do |f|
    reciprocal = Friendship.find_by(friend_id: f.member_id)
    reciprocal.destroy unless reciprocal.nil?
  end
end
