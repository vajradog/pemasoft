class RemoveTypeFromJobs < ActiveRecord::Migration
  def change
  	remove_column :jobs, :type
  end
end
