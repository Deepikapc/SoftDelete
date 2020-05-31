class CommentsController < ApplicationController
	 skip_before_action :verify_authenticity_token  
   include SoftDestroy
	def new
		@comment=Comment.new
	end
	def create
		@comment = Comment.new(comment_params)
		 if @comment.save
		 	puts params["comment"]["post_id"].inspect
		 	render :json => {:status => true}
		 else
		 	render :json => {:status => false}
		 end	
  end

  def edit
  	@comment = Comment.find(params["id"]) rescue nil
  end

  def update
  	@comment = Comment.find(params["id"]) rescue nil
  end

  def destroy
  	@comment = Comment.find(params["id"]) rescue nil
    if @comment.present?
	    if params["is_soft_delete"]  == false #hard delete
	  		@comment.destroy
	  		#redirect_to posts_path
	  		puts "*****INSIDE IF ********" 
	  	elsif params["is_soft_delete"] == true
	  		puts "comment soft destroyyyyyyyy"
	  	  soft_destroy_logic @comment
	  		# redirect_to posts_path
	  		#render :json => {:status => true}
	  	# else
	  	# 	render :json => {:status => false}
	  	end
  	end
  	redirect_to posts_path
  end

  private
	def comment_params
	  params.require(:comment).permit(:title,:body,:post_id)	  
	end
end
