class HomeController < ApplicationController

	def index
		@Question=Question.all
		@answer= Answer.all
	end

end
