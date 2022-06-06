class TasksController < ApplicationController
  def update
    # @task = Task.find(params[:id])
    # authorize @task
    # @task.user_id = params[:user_id]
    # @task.save
    # render json: @task.to_json
    @task = Task.find(params[:id])
    @project = @task.step.project
    @task.update(task_params)
    authorize @task
    respond_to do |format|
      format.html { redirect_to project_path }
      format.text { render partial: "shared/tasks_checkbox", locals: {task: @task}, formats: [:html] }
    end
  end

  # def completed
  #   ###
  #   @task.update
  #   @step = Step.find(params[:task_id])
  #   @step.completed if @task == @step.tasks.last
  # end

  private

  def task_params
    params.require(:task).permit(:name, :status, :done)
  end
end
