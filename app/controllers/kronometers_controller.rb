class KronometersController < ApplicationController
  authorize_resource
  def index
    @kms = Kronometer.order('date DESC')
    @users = User.where(:papieren_kronometer => true)
  end
  
  def new
    @km = Kronometer.new
	@folders = Folder.all
  end
  
  def create
    km = Kronometer.new(kronometer_params)
    if km.save
      redirect_to kronometers_path
      flash[:success] = "Kronometer succesvol geupload."
    else
      render 'new'
    end
  end
  
  def edit
    @km = Kronometer.find(params[:id])
    @folders = Folder.all
  end
  
  def update
    km = Kronometer.find(params[:id])
    km.update_attributes(kronometer_params)
    if km.save
      redirect_to kronometers_path
      flash[:success] = "Kronometer succesvol aangepast"
    else
      render 'edit'
    end
  end
  
  def destroy
    km = Kronometer.find(params[:id])
    km.destroy
    redirect_to kronometers_path
    flash[:success] = "Kronometer succesvol verwijderd"
  end
  
  def labels
    @users = User.where(:papieren_kronometer => true)
    
    respond_to do |format|
      format.pdf do
        render :pdf => "kronometer stickers #{Time.now}"
      end
    end
  end

  private

  def kronometer_params
    params.require(:kronometer).permit(:date, :file, :name, :folder_id)
  end
end
