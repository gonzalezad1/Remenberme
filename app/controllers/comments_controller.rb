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
def edit
		@comment= Comment.find(params[:id])
	end
	 def update
   @comment = Comment.find(params[:id])
   if @comment.update(permit_params)
     redirect_to questions_path
   else
     render 'edit'
   end
 end
def destroy
	@comment = Comment.find(params[:id])
    @comment.destroy
	redirect_to questions_path
   else
end
def permit_params
	params.require(:comment).permit(:user_id,:answer_id, :comment_body,:question_id)
end
end
