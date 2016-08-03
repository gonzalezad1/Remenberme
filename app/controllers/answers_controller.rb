class AnswersController < ApplicationController
	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.new(permits_parameters)

		if @answer.save
			redirect_to questions_path
		else 
			redirect_to new_question_answer_path
	end
	end
	def index
	@answer = Answer.all
	@question = Question.find(params[:question_id])
	end

	def show
		@answer = Answer.find(params[:id])
	end
	def permits_parameters
	params.require(:answer).permit(:question_id,:user_id, :answer_body)
	end
end
