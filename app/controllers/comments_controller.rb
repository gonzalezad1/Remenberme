class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end
	def create
		@comment = Comment.new(permit_params)
		if @comment.save 
		redirect_to questions_path
	else
		redirect_to questions_path
	end
	end

def show
	@comment = Comment.find(params[:id])
end

def permit_params
	params.require(:comment).permit(:user_id,:answer_id, :comment_body,:question_id)
end
end
