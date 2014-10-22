class Page < ActiveRecord::Base
	 validates :permalink, uniqueness: true, presence: true,
                   exclusion: {in: %w[signup login]}
	validates :content, presence: true
	validates :name, presence: true

	scope :header, -> { where nav: 'header'}
  scope :footer, -> { where nav: 'footer'}

	def to_param
		permalink
	end
	#FIRST FIGURE
end
