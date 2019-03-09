class TracksController < ApplicationController
  

def new
	@albums = Album.all
	@album = Album.find(params[:album_id])
	@track = @album.tracks.new
	render :new
end

def create
	@albums = Album.all
	@track = Track.new(track_params)
	if @track.save 
		redirect_to track_url(@track)
	else
		flash.now[:errors] = @track.errors.full_messages
		render :new
	end
end

def show
	@track = Track.find(params[:id])
	render :show
end

def edit
	@albums = Album.all
	@track = Track.find(params[:id])
	render :edit
end

def update
	@track = Track.find(params[:id])
	if @track.update_attributes(track_params) 
		redirect_to track_url(@track)
	else
		flash.now[:errors] = @track.errors.full_messages
		render :edit
	end
end

def destroy
	@track = Track.find(params[:id])
	@album = @track.album
	@track.destroy
	redirect_to album_url(@album)
end


private

	def track_params
		params.require(:track).permit(:album_id, :title, :ord, :track_type, :lyrics)
	end


end
