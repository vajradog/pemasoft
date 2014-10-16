class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :candidate

	validates :body, presence: true
end
