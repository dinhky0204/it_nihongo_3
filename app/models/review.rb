class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :review_comments, -> { order "created_at DESC"}
  after_update_commit {
    if self.status == true
      @followers = self.user.followers
      puts "===============================================\n"
      puts @followers;
      puts "===============================================\n"
      @followers.each do |follower|
        @notification = @notification = Notification.new(
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
