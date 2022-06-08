class DocumentsController < ApplicationController

  def change_status
    @document = Document.find(params[:id])
    @document.update(status: params[:status])
    authorize @document
    render json: { document_row: render_to_string(partial: 'shared/document_row', locals: { document: @document }, formats: :html) }.to_json
    # redirect_to project_path(@document.project)
  end
end
