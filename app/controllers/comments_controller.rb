class CommentsController < ApplicationController
	before_action :authenticate_user!, only:[:new,:edit]

	def create	
		
		params = comment_params
		commentable = params[:commentable_type].constantize.find(params[:commentable_id])
	    comment = commentable.comments.new(params)
	    if comment.save	    	
	    	if commentable.instance_of? Question
				redirect_to commentable
			elsif commentable.instance_of? Answer
				redirect_to commentable.question	
			end
		else
			@errors = comment.errors.full_messages
			if commentable.instance_of? Question
				render commentable
			elsif commentable.instance_of? Answer
				render commentable.question	
			end 
	    end
		#pendiente logica para comments desde answer
	end

	def destroy		
		comment= Comment.find(params[:id])
		comment.destroy
		if params[:question_id]
			redirect_to question_path(params[:question_id])
		elsif params[:answer_id]
			redirect_to question_path(Answer.find(params[:answer_id]).question)
		end
			
	end
		


	private
	def comment_params		
      	params.require(:comment).permit(:body, :commentable_type, :commentable_id).merge(user_id: current_user.id)      			
    end
end
