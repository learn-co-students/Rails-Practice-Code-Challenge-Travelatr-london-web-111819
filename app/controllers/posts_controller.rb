class PostsController < ApplicationController
    def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.likes = 0
		@post.save
        if @post.valid?
          redirect_to post_path(@post)
        else
          render :new
		end
		#   redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end

	def like
		@post = Post.find(params[:id])
		@post.update(likes: @post.likes + 1)
		redirect_to post_path(@post)
	end

	private
		def post_params
			params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
        end
end