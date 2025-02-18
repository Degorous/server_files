class FileUploadsController < ApplicationController
  before_action :set_file, only: [ :show, :edit, :update, :destroy ]
  def index
    @archives = FileUpload.all
  end

  def create
    archive = FileUpload.new(file_upload_params)
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

  def edit
  end

  def destroy
    @archive.destroy
    redirect_to file_uploads_path
    flash[:notice] = "Arquivo removido com sucesso"
  end

  def update
    if @archive.update(file_upload_params)
      redirect_to file_uploads_path
      flash[:notice] = "Arquivo atualizado com sucesso"
    else
      render :edit
      flash[:notice] = "Não foi possível atualizar o arquivo"
    end
  end

  private

  def set_file
    @archive = FileUpload.find(params[:id])
  end

  def file_upload_params
    params.require(:file_upload).permit(:file, :name)
  end
end
