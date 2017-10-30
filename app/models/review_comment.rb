class ReviewComment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  after_create_commit {
      @notification = @notification = Notification.new(
          from_user_id: self.user.id,
          to_user_id: self.review.user.id,
          type: Notification.types[:comment],
          review_id: self.review_id,
          status: Notification.statuses[:not_seen],
          text: self.content
      )
      @notification.save
  }
end
