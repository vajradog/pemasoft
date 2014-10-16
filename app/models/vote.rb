class Vote < ActiveRecord::Base
	belongs_to :candidate
	belongs_to :user

	validates :user_id, uniqueness: { scope: :candidate_id }
end
