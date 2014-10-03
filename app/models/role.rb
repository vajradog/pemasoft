class Role < ActiveRecord::Base
	belongs_to :user
	before_create :default_role

	private
	
  def default_role
    self.role =['banned']
  end
end
