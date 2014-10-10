class Candidate < ActiveRecord::Base
	belongs_to :job
	belongs_to :user
	has_many :comments
	has_reputation :votes, source: :user, aggregated_by: :sum

	validates :resume, presence: true
	validates :cover_letter, presence: true

	scope :received, -> { where status: 'Application Received'}
  scope :under_consideration, -> { where status: 'Under Consideration'}
  scope :declined, -> { where status: 'Declined'}
  scope :interview, -> { where status: 'Interview Request'}

  #def to_param
  #  self.user.email
  #end

end
