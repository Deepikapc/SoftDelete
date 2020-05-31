class Comment < ApplicationRecord
	
	belongs_to :post


  # def comment_soft_destroy comment
  # 	#abort comment.inspect
  # 	comment.update_attributes(is_soft_delete:true)
  # end
end
