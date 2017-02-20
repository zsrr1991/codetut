class PhotosController < ApplicationController
 include AuthenticationHelper
  
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :login_required, except: [:index, :show]
  def index
  	@photos = Photo.all
  end

  def show
  end

  def new
  	@photo = Photo.new
  end

  def create
	@photo = Photo.new(photo_params)
  @photo.user = current_user
		if @photo.save
      flash[:success] = "Zdjęcie zostało dodane !"
			redirect_to @photo
		else
      flash.now[:danger] = "Nie można utworzyć zdjęcia..."
			render :new
		end
	end

  def edit
  end 	 

  def update
   	 if @photo.update (photo_params)
      flash[:success] = "Zdjęcie zostało zaktualizowane poprawinie"
   	 	redirect_to @photo
   	 else
      flash.now[:danger]= "Nie można zaktualizować zdjęcia"
   	 	render :edit
   	 end
  end

  def destroy
		@photo.destroy
    flash[:success] = "Zdjęcie zostało skasowane"
		redirect_to photos_url
  end


private
  def set_photo
    @photo = Photo.find(params[:id])
  end

	def photo_params
		params.require(:photo).permit(:title, :description, :image)
	end
	
end


