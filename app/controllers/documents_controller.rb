class DocumentsController < ApplicationController

  def change_status
    @document = Document.find(params[:id])
    @document.update(status: params[:status])
    @project = @document.project
    authorize @document
    render json: { document_row: render_to_string(partial: 'shared/project_show_documents', locals: { project: @project }, formats: :html) }.to_json
  end
end
