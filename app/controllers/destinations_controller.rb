class DestinationsController < ApplicationController

	# helper ApplicationHelper


    def index
		@destinations = Destination.all
	end

	def show
		@destination = Destination.find(params[:id])
		@most_recent_5_posts = @destination.most_recent_N_posts(5)
		@most_featured_post = @destination.most_liked_N_posts(1)
		@average_age = @destination.average_age_of_all_bloggers_posted_on
	end

	########NOT NEEDED

	def new
		@destination = Destination.new
	end

	def create
	  @destination = Destination.new(destination_params)
	  @destination.save
	  redirect_to destination_path(@destination)
	end

	def edit
		@destination = Destination.find(params[:id])
	end

	def update
	  @destination = Destination.find(params[:id])
	  @destination.update(destination_params)
	  redirect_to destination_path(@destination)
	end
	########NOT NEEDED

	private
		def destination_params
			params.require(:destination).permit(:name, :country)
        end
end