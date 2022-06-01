class ProjectsController < ApplicationController
  def index
    if params[:query].present?
      @projects = policy_scope(Project).where("name ILIKE ?", "%#{params[:query]}%")
    else
      @projects = policy_scope(Project)
    end
  end

  def new
    @project = Project.new
    authorize @project
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project.update(project_params)

    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :start_at,
      :end_at,
      :progress,
      :company_name,
      :company_email,
      :duration
    )
  end
end
