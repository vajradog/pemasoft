class JobsController < ApplicationController
	load_and_authorize_resource

	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		#@job = Job.new(job_params) #because of the load_and_authorize_resource method

		if @job.save
			flash[:notice] = "Job was created"
			redirect_to root_path
		else
			flash[:alert] = "Sorry, could not create job"
			render :new
		end
	end

	def show
		@jobs = Job.all
		@candidate = Candidate.new
		#@job.candidate = Candidate.find(params[:id])
		#@candidates = @job.candidates.all
	end

	def edit
	#	@job = Job.find(params[:id]) #because of the load_and_authorize_resource method
	end

	def update
	#	@job = Job.find(params[:id]) #because of the load_and_authorize_resource method
		if @job.update_attributes(job_params)
			flash[:notice] = "job updated"
			redirect_to root_path
		else
			flash[:notice] = "could not update job"
			render edit
		end
	end

	def destroy
		@job.destroy
		flash[:notice] = "Successfully destroyed job"
		redirect_to jobs_path
	end

	private

	def job_params
		params.require(:job).permit(:title, :description, :location, :position_type)
	end
end