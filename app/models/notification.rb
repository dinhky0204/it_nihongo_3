class Notification < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"

  after_create_commit {
    NotificationBroadcastJob.perform_later(self)}
  self.inheritance_column = :_type_disabled

  enum type: [:follow, :like, :comment]
  enum status: [:not_seen, :seen]
end
