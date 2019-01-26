class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :reply

  serialize :upvote_user_ids, Set
  serialize :downvote_user_ids, Set
end
