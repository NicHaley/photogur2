class PicturesController < ApplicationController
	def index
		@most_recent_pictures = Picture.most_recent_five
	end

	def show
		@picture = Picture.find(params[:id].to_i)
	end

	def edit
		@picture = Picture.find(params[:id].to_i)
	end

	def update
		@picture = Picture.find(params[:id].to_i)
		if @picture.update_attributes(picture_params)
			redirect_to "/pictures/#{@picture.id}"
		else
			render :edit
		end
	end

	def delete
		@picture = Picture.find(params[:id].to_i)
		@picture.destroy
		redirect_to pictures_url
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		if @picture.save
			redirect_to pictures_url
		else
			render :new
		end
	end

	private
	def picture_params
		params.require(:picture).permit(:artist, :title, :url)
	end
end
