class Job < ActiveRecord::Base
	has_many :candidates
	belongs_to :user

	validates :title, presence: true
	validates :description, presence: true

	scope :full_time, -> { where position_type: 'Full-time'}
  scope :under_consideration, -> { where position_type: 'Part-time'}
  scope :contract, -> { where position_type: 'Contract'}
  scope :undisclosed, -> { where position_type: 'Undisclosed'}
end
