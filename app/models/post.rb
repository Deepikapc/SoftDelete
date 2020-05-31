class Post < ApplicationRecord
	has_many :comments,:dependent => :destroy
	
	def load_comments
		self.comments.where(:is_soft_delete => false)
	end
end
