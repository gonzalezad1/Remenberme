class MysummitsController < ApplicationController

	def index
		@question = Question.all
	
	end
 def questions_params
    params.require(:question).permit(:question_title,:user_id)
  end


end
