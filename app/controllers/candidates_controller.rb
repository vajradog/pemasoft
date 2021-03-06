class CandidatesController < ApplicationController
	  load_and_authorize_resource :job
	  load_and_authorize_resource :candidate, :through=> :job



	def index
		#authorize! :read, Ability
		#@candidates = Candidate.reorder('votes desc').find_with_reputation(:votes, :all)
		#@candidates = Candidate.order("RANDOM()")  
		@job = Job.find(params[:job_id])
		@candidates = @job.candidates.reorder('votes desc').find_with_reputation(:votes, :all)
	
	end

	def create
		@job = Job.find(params[:job_id])
		@candidate = @job.candidates.build(candidate_params)
		@candidate.user = current_user
		@candidate.status = "Application Received"

		if @candidate.save
			flash[:success] = "Application received"
			redirect_to root_path #job_candidate_path(@job, @candidate)
		else
			flash[:error] = "Could not save your application"
			redirect_to job_path(@job)
		end
	end

	def show
		@job = Job.find(params[:job_id])
		@candidate = Candidate.find(params[:id])
		@comment = Comment.new
		@candidates = @job.candidates.reorder('votes desc').find_with_reputation(:votes, :all)
		#@candidate.job = @job
	end

	def edit
		@job = Job.find(params[:job_id])
		@candidate = Candidate.find(params[:id])
	end

	def update
		@candidate = Candidate.find(params[:id])
		if @candidate.update_attributes(candidate_params)
			flash[:notice] = "Candidate updated"
			redirect_to job_candidate_path
		else
			flash[:notice] = "Could not update candidate"
			render :back
		end
	end

	def vote
		value = params[:type] == "up" ? 1 : -1
		#@job = Job.find(params[:job_id])
		@candidate = Candidate.find(params[:id])
		@candidate.add_or_update_evaluation(:votes, value, current_user)
		redirect_to :back, notice: "Thank you for recommending this candidate. Awesome!"
	end


	private

	def candidate_params
		params.require(:candidate).permit(:resume, :cover_letter, :job_id, :github, :twitter, :linkedin, :status)
	end
end