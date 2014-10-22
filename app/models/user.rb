class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :set_default_role

	
         
	has_many :jobs
	has_many :candidates, dependent: :destroy
	has_many :comments
	#has_many :evaluations, class_name: "RSEvaluation", as: :source
	has_reputation :votes, source: {reputation: :votes, of: :candidates}, aggregated_by: :sum

	has_many :roles

	validates :first_name, presence: true
	validates :last_name, presence: true


	ROLES = %w[admin moderator registered guest banned]

	def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
   ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def role?(role)
    roles.include? role.to_s
  end

  def is?(role)
  	roles.include?(role.to_s)
	end


	def voted_for?(candidate)
		evaluations.where(target_type: candidate.class, target_id: candidate.id).present?
	end

	def full_name
		[first_name, last_name].join(' ')
	end

	def self.text_search(query)
		if query.present?
			search(query)
		else
			scoped
		end
	end

	private
	
  def set_default_role
  	if User.count == 0
  		self.roles = [ "admin" ]
  	else
    	self.roles = [ "registered" ]
  	end
  end
end
