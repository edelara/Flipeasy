class CreateStepsAndTasksForProject

  STEPS_AND_TASKS = {
    "Create Project" => {
      deadline: 30,
      tasks: [
        "Invite founder to join Flipeasy (to complete questionnaire and upload legal documents of the company)",
        "Review questionnaire"
      ]
    },
    "Getting Ready" => {
      deadline: 25,
      tasks: [
        "Draft flip Pro-forma model",
        "Determine the valuation of the company"
      ]
    }
  }

  def initialize(project)
    @project = project
  end

  def call
    STEPS_AND_TASKS.each do |step, infos|
      step = Step.create!(name: step, project: @project, deadline: @project.end_at - infos[:deadline].days)
      infos[:tasks].each do |task_name|
        Task.create!(name: task_name, step: step)
      end
    end
  end
end


# CreateStepsAndTasksForProject.new(project).call
