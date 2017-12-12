class Question < ApplicationRecord
  belongs_to :user
  has_many :comment, :as => :commentable
  has_many :vote, :as => :votable
end
