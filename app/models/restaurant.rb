class Restaurant < ApplicationRecord
	mount_uploader :image, PhotoUploader
	validates_presence_of :name
	belongs_to :category
	delegate :name, to: :category, prefix: true, allow_nil: true

	# 當 Restaurant 物件被刪除時，順便刪除依賴的 Comment
	has_many :comments, dependent: :destroy

	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user

	def is_favorited?(user)
		self.favorited_users.include?(user)
	end	
end
