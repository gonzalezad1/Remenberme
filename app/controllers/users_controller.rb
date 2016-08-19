class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	 def update
   @user = User.find(params[:id])
   if @user.update(permit_params)
     redirect_to @user
   else
     render 'edit'
   end
 end
def destroy
	redirect_to root_path
   else
end

 def permit_params
 	params.require(:user).permit(:fullname,:nickname, :phone_number,:email,:password,:description,:interest)
end
 def user_params
    params.require(:user).permit(:name, :tag_list) ## Rails 4 strong params usage
  end
end

