class QuestionsController < ApplicationController
	def new
		@question = Question.new

	end

	def create
		@question =  Question.new(questions_params)
		@question.tag_list = questions_params[:tag_list]
		if @question.save
			redirect_to root_path

		else 
		redirect_to new_question_path 
		end
	end

	def edit
		@question= Question.find(params[:id])
	end
	 def update
   @question = Question.find(params[:id])
   if @question.update(questions_params)
     redirect_to questions_path
   else
     render 'edit'
   end
 end
def destroy
	@question = Question.find(params[:id])
    @question.destroy
	redirect_to questions_path
   else
end
	
	def index
		 if params[:tag]
      @question = Question.tagged_with(params[:tag])

    	else
  	@search = Question.search do
    fulltext params[:search]
  							end
  	@question = @search.results

  	@answer = Answer.all
		end
	end

	def all
		@question = Question.all 
	end

	def show
		if params[:tag]
      @question = Question.tagged_with(params[:tag])
  else
		@question = Question.find(params[:id]) 
		@answer = Answer.new
end
	end

 def questions_params
    params.require(:question).permit(:question_title,:user_id, :tag_list,:name)
  end
 
 def tagged
    if params[:tag].present? 
      @question = Question.tagged_with(params[:tag])
    else 
      @question = Question.postall
    end  
 end

end
