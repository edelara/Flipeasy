class TasksController < ApplicationController
  def update
    @task = Task.find(params[:id])
    authorize @task
    @task.user_id = params[:user_id]
    @task.save
    render json: @task.to_json
  end

  def completed
    ###
    @task.update
    @step = Step.find(params[:task_id])
    @step.completed if @task == @step.tasks.last
  end
end
