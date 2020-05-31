module SoftDestroy

def soft_destroy_logic post
	# abort post
	post.update_attributes(is_soft_delete:true)
end  

end