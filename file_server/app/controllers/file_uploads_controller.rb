class FileUploadsController < ApplicationController
  before_action :set_file, only: [ :show, :destroy ]
  def index
    @archives = FileUpload.all
  end

  def create
    archive = FileUpload.new(name: params[:file_upload][:file].original_filename)
    archive.file.attach(params[:file_upload][:file])

    if archive.save
      redirect_to file_uploads_path
      flash[:notice] = "Upload realizado com sucesso!"
    else
      render :new
      flash[:notice] = "Não foi possível enviar o arquivo"
    end
  end

  def new
    @archive = FileUpload.new
  end

  def show
  end

  def destroy
    @archive.destroy
    redirect_to file_uploads_path
    flash[:notice] = "Arquivo removido com sucesso"
  end

  private

  def set_file
    @archive = FileUpload.find(params[:id])
  end
end
