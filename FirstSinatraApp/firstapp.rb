require 'active_record'
require 'sinatra'

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "photo_gallery"
)

class Gallery < ActiveRecord::Base
  has_many :images, dependent: :destroy
end

class Image < ActiveRecord::Base
  belongs_to :gallery
end

#not_found do
#  erb :oh_noes
#end

get "/galleries/:gallery_id/images/new" do
  @gallery = Gallery.find(params[:gallery_id])
  erb :images_new 
end

get "/galleries/:gallery_id/images/:image_id" do
  @image = Image.find(params[:image_id])
  erb :image
end

get "/galleries/:gallery_id/images/:images_id/edit" do
  @image = Image.find(params[:images_id])
  erb :image_edit
end

delete "/galleries/:gallery_id/images/:image_id" do
  Image.find(params[:image_id]).destroy
  redirect("/galleries/#{params[:gallery_id]}")
end

delete "/galleries/:gallery_id" do
  gallery = Gallery.find(params[:gallery_id])
  gallery.destroy
  redirect("/")
end

patch "/galleries/:gallery_id/images/:image_id" do
  image = Image.find(params[:image_id])
  image.update(params[:images])
  redirect("/galleries/#{image.gallery_id}/images/#{image.id}")
end

post "/galleries/:gallery_id/images" do
  image = Image.new(params[:images])
  image.gallery_id = params[:gallery_id]
  image.save
  redirect("/galleries/#{image.gallery_id}/images/#{image.id}")
end


get "/galleries/:id/edit" do
  @gallery = Gallery.find(params[:id])
  erb :gallery_edit
end

patch "/galleries/:id" do
  gallery = Gallery.find(params[:id])
  gallery.update(params[:gallery])
  redirect "/galleries/#{gallery.id}"
end

post "/galleries" do
  gallery = Gallery.create(params[:gallery])
  redirect("/")
end

get "/galleries/new" do
  erb :galleries_new
end

get "/" do
  @galleries = Gallery.all
  erb :index
end

get "/galleries/:id" do
  @gallery = Gallery.find(params[:id])
  @images = @gallery.images
  @othergalleries = Gallery.where.not(id:  params[:id])
  erb :gallery
end

