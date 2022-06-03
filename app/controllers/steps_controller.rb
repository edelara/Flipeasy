class StepsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @steps = policy_scope(@project.steps)
    @users = User.all
  end

  def update
    @step = Step.find(params[:id])
    # puts params[:user_id]
    authorize @step
    @step.user_id = params[:user_id]
    # binding.pry
    @step.save
    render json: @step.to_json
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :deadline,
      :completed_at
    )
  end
end
