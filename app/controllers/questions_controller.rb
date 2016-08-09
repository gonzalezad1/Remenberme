class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@question =  Question.new(questions_params)
		if @question.save
			redirect_to root_path

		else 
		redirect_to new_question_path 
		end
	end
	def index
		
  	@search = Question.search do
    fulltext params[:search]
  		end
  	@question = @search.results
	end

	def all
		@question = Question.all 
	end

	def show
		@question = Question.find(params[:id]) 
		@answer = Answer.new
	end

 def questions_params
    params.require(:question).permit(:question_title,:user_id)
  end
end
