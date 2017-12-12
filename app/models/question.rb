class Question < ApplicationRecord
  belongs_to :user
  has_many :comment, :as => :commentable
end
