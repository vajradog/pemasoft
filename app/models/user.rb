class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
	has_many :jobs
	has_many :candidates, dependent: :destroy
	has_many :comments
	has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source

	#has_reputation :votes, source: {reputation: :votes, of: :candidates}, aggregated_by: :sum

	def voted_for?(candidate)
		evaluations.where(target_type: candidate.class, target_id: candidate.id).present?
	end
end
