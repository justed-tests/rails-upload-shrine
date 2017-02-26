# !?
class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      flash[:success] = 'Photo added'
      redirect_to photos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      flash[:success] = 'Photo updated!'
      redirect_to photos_path
    else
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image, :remove_image)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
