class PostsController < ApplicationController

    def index
        @posts = Post.all 
    end

    def new
        @post = Post.new
    end

    def create
       @post = Post.create(post_params)

        if @post.valid?
        redirect_to post_path(@post)
        else
            render :new
        end
       
    end

    def show
        @post = Post.find(params[:id])
    end

    def like 
        @post = Post.find(params[:id])
        @post.update(likes: @post.likes + 1)
        redirect_to post_path(@post)
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post.id)
    end


    private

    def post_params
        params.require(:post). permit(:title, :content, :blogger_id, :destination_id)
    end

end