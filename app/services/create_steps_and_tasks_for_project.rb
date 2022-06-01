class CreateStepsAndTasksForProject
  STEPS_AND_TASKS = {
    "Create Project" => {
      deadline: 29,
      tasks: [
        "Invite founder to join Flipeasy",
        "Review questionnaire",
        "Create a team and assign steps",
        "Schedule kick-off call with the founder"
      ]
    },

    "Getting Ready" => {
      deadline: 27,
      tasks: [
        "Draft flip Pro-forma model",
        "Determine the valuation of the company",
        "Consult tax team"
      ]
    },

    "Establish the U.S Corporation" => {
      deadline: 20,
      tasks: [
        "Draft Incorporation Documents",
        "File Certificate of Incorporation"
      ]
    },

    "Obtain EIN and open U.S. Bank Account" => {
      deadline: 15,
      tasks: []
    },

    "Issuance & Exchange of Shares" => {
      deadline: 10,
      tasks: [
        "Draft Flip Documents"
      ]
    },

    "Flip Closing" => {
      deadline: 05,
      tasks: [
        "Invite signatories to sign"
      ]
    },

    "Post-Flip Closing" => {
      deadline: 03,
      tasks: [
        "File 83(b) election",
        "File Contribution Agreement",
        "Update Shareholders Registers & Accounts",
        "Schedule Reminder for Delaware Tax Compliance"
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
