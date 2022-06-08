class ProjectsController < ApplicationController
  def index
    if params[:query].present?
      @projects = policy_scope(Project).where("name ILIKE ?", "%#{params[:query]}%")
    elsif params[:filter].present?
      @projects = policy_scope(Project).where(user: params[:filter])
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
    @project.tag_list.add("coucou", "hello", "test", "ahbon", "oui")
    @project.tag_list.remove("coucou", "hello", "test", "ahbon", "oui")
    @project.user = current_user
    authorize @project
    if @project.save
      redirect_to project_steps_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    @project.user_id = params[:user_id]
    @project.save
    render json: @project.to_json
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
      :duration,
      :company_landing_page,
      :photo,
      :tag_list
    )
  end
end
