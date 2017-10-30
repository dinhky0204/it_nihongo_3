class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :review_comments, -> { order "created_at DESC"}

  after_update_commit {
    if self.status_previously_changed? && self.status_previous_change[0] == false && self.status_previous_change[1] == true
      @followers = self.user.followers
      @followers.each do |follower|
        @notification = Notification.find_or_create_by(
            from_user_id: self.user.id,
            to_user_id: follower.id,
            type: Notification.types[:new_review],
            review_id: self.id,
            status: Notification.statuses[:not_seen]
        )
        @notification.save
      end
    end
  }
end
