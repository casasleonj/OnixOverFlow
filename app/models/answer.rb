class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comment, :as => :commentable
  has_many :vote, :as => :votable
end
