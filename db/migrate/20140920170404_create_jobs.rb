class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :title
    	t.text :description
    	t.string :location
    	t.string :type

      t.timestamps
    end
  end
end
