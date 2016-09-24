class Answer < ActiveRecord::Base

	belongs_to :question
	belongs_to :user
	has_many :comments
	has_many :likes

	acts_as_votable


 def has_liked?(comment)
    likes.where(comment_id: comment.id).present?
 end

end
