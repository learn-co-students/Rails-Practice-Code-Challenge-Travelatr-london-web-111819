class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = Post.find(params[:id])
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
    end

    private

    def post_params
        params.require(:post).permit(

        )
    end
    
end