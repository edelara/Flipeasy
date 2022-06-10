class TasksController < ApplicationController
  def update
    # @task = Task.find(params[:id])
    # authorize @task
    # @task.user_id = params[:user_id]
    # @task.save
    # render json: @task.to_json
    @task = Task.find(params[:id])
    @task.user = current_user
    @project = @task.step.project
    @task.update(task_params)
    authorize @task
    respond_to do |format|
      format.html { redirect_to project_path }
      format.text { render partial: "shared/tasks_checkbox", locals: {task: @task}, formats: [:html] }
    end
    if @task.step.tasks.where(done: false).count.zero?
      @task.step.complete!
    else
      @task.step.not_complete!
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :status, :done)
  end
end
