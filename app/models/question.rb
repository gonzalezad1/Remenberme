class Question < ActiveRecord::Base

	belongs_to :user
	has_many :answers
	acts_as_votable
    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :tags

    has_many :tags, through: :tag_list

	searchable do
  		text :question_title, :boost => 5
  		text :tag_list
  			   end

end
