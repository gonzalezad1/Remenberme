class AnswersController < ApplicationController


	def like
    	@answer = Answer.find(params[:id])
    	@answer.liked_by current_user
    	redirect_to question_answer_path
	end

	def dislike
    	@answer = Answer.find(params[:id])
    	@answer.disliked_by current_user
    	redirect_to question_answer_path
	end

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
		@question = Question.find(params[:question_id])
		@comment = Comment.new
		@commented = Comment.all
	end
	
	def edit
		@answer= Answer.find(params[:id])
	end
	 
	 def update
	   @answer = Answer.find(params[:id])
   	   if @answer.update(permits_parameters)
     	  redirect_to question_answer_path
 	   else
     	  render 'edit'
   	   end
 	end

	def destroy
		@answer = Answer.find(params[:id])
    	@anwser.destroy
		redirect_to questions_path   
	end

	def permits_parameters
		params.require(:answer).permit(:question_id,:user_id, :answer_body, :answer_id)
	end
end
