class CreateStepsAndTasksForProject
  STEPS_AND_TASKS = {
    "Create Project" => {
      deadline: 29,
      icon: "fa-solid fa-hands-holding-circle",
      tasks: [
        "Invite founder to join Flipeasy",
        "Review questionnaire",
        "Create a team and assign steps",
        "Schedule kick-off call with the founder"
      ]
    },

    "Getting Ready" => {
      deadline: 27,
      icon: "fa-solid fa-circle-play",
      tasks: [
        "Draft flip Pro-forma model",
        "Determine the valuation of the company",
        "Consult tax team"
      ]
    },

    "U.S Corporation" => {
      deadline: 20,
      icon: "fa-solid fa-building",
      tasks: [
        "Draft Incorporation Documents",
        "File Certificate of Incorporation"
      ]
    },

    "EIN and U.S. Bank Account" => {
      deadline: 15,
      icon: "fa-solid fa-piggy-bank",
      tasks: []
    },

    "Flip" => {
      deadline: 10,
      icon: "fa-solid fa-burger",
      tasks: [
        "Draft Flip Documents"
      ]
    },

    "Closing" => {
      deadline: 05,
      icon: "fa-solid fa-shuttle-space",
      tasks: [
        "Invite signatories to sign"
      ]
    },

    "Post-Closing" => {
      deadline: 03,
      icon: "fa-solid fa-paper-plane",
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
