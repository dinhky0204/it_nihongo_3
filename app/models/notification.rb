class Notification < ApplicationRecord
  include ActionView::Helpers::UrlHelper

  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  belongs_to :review, optional: true

  validates_uniqueness_of :to_user_id, :if => :check_review_exits_and_new_reviews?, scope: [:review_id, :from_user_id]
  enum type: [:follow, :like, :comment, :new_review]
  enum status: [:not_seen, :seen]

  after_create_commit {
    NotificationBroadcastJob.perform_later(self)}

  after_update_commit {
    if self.status_previously_changed? && self.not_seen?
      NotificationBroadcastJob.perform_later(self)
    end
  }
  self.inheritance_column = :_type_disabled

  def check_review_exits_and_new_reviews?
    self.review_id != -1 && self.new_review?
  end

  def get_message
    if self.follow?
      "#{self.from_user.name} has followed you"
    elsif self.new_review?
      "#{self.from_user.name} created new review"
    elsif self.like?
      "#{self.from_user.name} liked your review"
    elsif self.comment?
      "#{self.from_user.name} commented on your review: \"#{self.text}\""
    else
      ""
    end
  end

  def get_url
    if self.follow?
      Rails.application.routes.url_helpers.user_url(self.to_user)
    elsif self.new_review? || self.like? || self.comment?
      Rails.application.routes.url_helpers.review_url(self.review)
    else
      ""
    end
  end
end
