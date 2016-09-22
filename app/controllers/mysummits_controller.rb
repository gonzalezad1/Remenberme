class MysummitsController < ApplicationController

	def index
		@question = Question.all
		@answer = Answer.all
		@comment = Comment.all
	
	end
 def questions_params
    params.require(:question).permit(:question_title,:user_id)
  end


end
