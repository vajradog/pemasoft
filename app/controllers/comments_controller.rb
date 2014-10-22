class CommentsController < ApplicationController
	load_and_authorize_resource

	def create
		@candidate = Candidate.find(params[:candidate_id])
		@comment = @candidate.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:notice]= "Comment Saved. Thanks!"
			redirect_to job_candidate_path(@candidate.job, @candidate)
		else
			#flash.now[:error]= "Sorry could not save comment"
			 #respond_with(@candidate)

			 redirect_to(job_candidate_path(@candidate.job, @candidate), :alert => 'Sorry could not save comment. Your comment body was blank.')


		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id, :candidate_id, :vote)
	end
end 