class QuestionsController < ApplicationController
	before_action :authenticate_user!, only:[:new]

	def index
	end

	def new
		@question = Question.new
	end
end
