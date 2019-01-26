class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :reply, polymorphic: true

  has_many :comments, as: :reply

  serialize :helpful_user_ids, Set
end
