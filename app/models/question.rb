class Question < ActiveRecord::Base
belongs_to :user
has_many :answer
acts_as_votable


searchable do
  text :question_title, :boost => 5
  end

end
