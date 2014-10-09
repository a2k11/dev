class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end
  def create
    @gallery = Gallery.new(find_gallery_params)

    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

 def destroy
   gallery = Gallery.find(params[:id])
   gallery.delete

   redirect_to galleries_path
 end
 def edit
   @gallery = Gallery.find(params[:id])
   
 end
 def update
   @gallery = Gallery.find(params[:id])

   if @gallery.update(find_gallery_params)
     redirect_to gallery_path(@gallery)
   else
     render :edit
   end

 end

 private

 def find_gallery_params
   params.require(:gallery).permit(:name, :description, :cover_image)
 end

end
