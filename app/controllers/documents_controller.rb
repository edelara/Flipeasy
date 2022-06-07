class DocumentsController < ApplicationController

  def done
    @document = Document.find(params[:id])
    @document.update(status: params[:status])
    authorize @document
    redirect_to project_path(@document.project)
  end
end
