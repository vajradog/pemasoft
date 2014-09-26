class JobsController < ApplicationController

	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)

		if @job.save
			flash[:success] = "Job was created"
			redirect_to root_path
		else
			flash[:notice] = "Sorry, could not create job"
			render :new
		end
	end

	def show
		@jobs = Job.all
		@job = Job.find(params[:id])
		@candidate = Candidate.new
		#@job.candidate = Candidate.find(params[:id])
		#@candidates = @job.candidates.all
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		if @job.update_attributes(job_params)
			flash[:notice] = "job updated"
			redirect_to @job
		else
			flash[:notice] = "could not update job"
			render edit
		end
	end

	private

	def job_params
		params.require(:job).permit(:title, :description, :location, :position_type)
	end
end