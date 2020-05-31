class PostsController < ApplicationController
	skip_before_action :verify_authenticity_token
  include SoftDestroy

	def index
		@posts=Post.all.where(is_soft_delete:false)
	end

	def index_reload
		@posts=Post.all.where(is_soft_delete:false)	
	end

	def new
		@post=Post.new
	end
	def create
		@post = Post.new(post_params)
		 if @post.save
		 	render json: {message:" Post created successfully!"},status: :ok
		 	#redirect_to posts_path
		 else
		 	render :json => {status:false}
		 	#render new_post_path
		 end	
  end

  def trash_list
		@posts=Post.all.where(is_soft_delete:true)
  end

  def restore_list
  	@post = Post.find(params["post_id"])
  	@post.update_attributes(is_soft_delete:params["is_soft_delete"])
  end

  def show
  	@post = Post.find(params[:id]) rescue nil
  	@comment = Comment.new
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post .update_attributes(post_params)
		  #redirect_to rooms_path(@post.id)
		  render json: {message:" Post created successfully!"},status: :ok 
		else
		 #render action: "edit"
		render :json => {status:false} 
	  end
  end

  def destroy
  	@post = Post.find(params[:id]) rescue nil
  	if @post.present?
	  	if params["is_soft_delete"]  == "false" #hard delete
	  		@post.destroy
	  		redirect_to posts_path
	  		puts "*****INSIDE IF ********"
	  	elsif params["is_soft_delete"] == "true" #soft destroy
	  		puts "inside else"
	  		soft_destroy_logic @post
	  		redirect_to posts_path
	  		#render :json => {status:true}
	  	else
	  		render :json => {status:false}
	  	end
  	end
  end

  private
	def post_params
	  	params[:post].permit(:title,:body)
	end

end
