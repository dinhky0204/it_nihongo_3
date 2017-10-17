class User < ApplicationRecord
  has_many :reviews
  has_many :active_relationships, class_name:  "Follow",
           foreign_key: "follower_id",
           dependent:   :destroy
  has_many :passive_relationships, class_name:  "Follow",
           foreign_key: "followed_id",
           dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  mount_uploader :avatar, GameUploader

  #enum gender: [:male, :female]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  def my_valid_password?(_password)
    if valid_password?(_password)
      return true
    else
      self.errors.add(:current_password, _password.blank? ? :blank : :invalid)
    end
    return false
  end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
