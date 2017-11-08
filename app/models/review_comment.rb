class ReviewComment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  after_create_commit {
    # send notification to Review's owner
    if self.user.id != self.review.user.id
      @notification = Notification.new(
          from_user_id: self.user.id,
          to_user_id: self.review.user.id,
          type: Notification.types[:comment],
          review_id: self.review_id,
          status: Notification.statuses[:not_seen],
          text: self.content
      )
      @notification.save
    end

    # send notifications to all commented Users
    @users = self.review.review_comments.all.collect(&:user).uniq.reject{|user| user.id == self.review.user.id || user.id == self.user.id}
    @users.each do |user|
      @notification = Notification.new(
          from_user_id: self.user.id,
          to_user_id: user.id,
          type: Notification.types[:comment_on_same_review],
          review_id: self.review_id,
          status: Notification.statuses[:not_seen],
          text: self.content
      )
      @notification.save
    end
  }
end
