class BloggersController < ApplicationController
    def index
		@bloggers = Blogger.all
	end

	def show
        @blogger = Blogger.find(params[:id])
        @the_post = @blogger.featured_post
        # @blogger_top_5_posts_destinations = @blogger.top_N_by_blogger(5).map{|post|post.destination.name}.uniq
	end

	def new
		@blogger = Blogger.new
	end
    
    def create
        @blogger = Blogger.create(blogger_params)
        
        if @blogger.valid?
          redirect_to bloggers_path
        else
          render :new
        end
    end

    ##########NOT NEEDED
	def edit
		@blogger = Blogger.find(params[:id])
	end

	def update
      @blogger = Blogger.find(params[:id])
      @blogger.update(blogger_params)
      
      if @blogger.valid?
        redirect_to blogger_path(@blogger)
      else
        render :edit
      end
      
	end
    #############NOT NEEDED

    private
    
	def blogger_params
		params.require(:blogger).permit(:name, :bio, :age)
    end

end