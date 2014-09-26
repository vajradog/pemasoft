class RenameJobTypeInJobs < ActiveRecord::Migration
  def change
  	rename_column :jobs, :job_type, :position_type
  end
end
