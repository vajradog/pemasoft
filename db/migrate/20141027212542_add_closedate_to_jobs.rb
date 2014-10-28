class AddClosedateToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :closedate, :datetime
  end
end
