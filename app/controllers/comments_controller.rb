class CommentsController < ApplicationController
	load_and_authorize_resource

	def create
		@candidate = Candidate.find(params[:candidate_id])
		@comment = @candidate.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:notice]= "Comment Saved"
			redirect_to job_candidates_path
		else
			flash[:notice]= "Sorry could not save comment"
			 render action: 'edit' 
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id, :candidate_id, :vote)
	end
end 