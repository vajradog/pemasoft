class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
    	t.text :resume
    	t.text :cover_letter
    	t.string :personal_website
    	t.string :github
    	t.string :linkedin
    	t.string :twitter
    	


      t.timestamps
    end
  end
end
