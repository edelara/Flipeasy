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
      ],
      documents: []
    },

    "Getting Ready" => {
      deadline: 27,
      icon: "fa-solid fa-circle-play",
      tasks: [
        "Draft flip Pro-forma model",
        "Determine the valuation of the company",
        "Consult tax team"
      ],
      documents: []
    },

    "U.S Corporation" => {
      deadline: 20,
      icon: "fa-solid fa-building",
      tasks: [
        "Draft Incorporation Documents",
        "File Certificate of Incorporation"
      ],
      documents: [
        "Certificate of Incorporation",
        "Bylaws",
        "Action of Incorporator",
        "Initial Board Consent",
        "Stockholders Consent",
        "Indemnification Agreements"
      ]
    },

    "EIN and U.S. Bank Account" => {
      deadline: 15,
      icon: "fa-solid fa-piggy-bank",
      tasks: [],
      documents: []
    },

    "Flip" => {
      deadline: 10,
      icon: "fa-solid fa-burger",
      tasks: [
        "Draft Flip Documents"
      ],
      documents: [
        "Board Consent",
        "Contribution Agreement",
        "Share Transfer Form",
        "Shareholders Individual Account",
        "Securities Exchange Agreement"
      ]
    },

    "Closing" => {
      deadline: 05,
      icon: "fa-solid fa-shuttle-space",
      tasks: [
        "Invite signatories to sign"
      ],
      documents: []
    },

    "Post-Closing" => {
      deadline: 03,
      icon: "fa-solid fa-paper-plane",
      tasks: [
        "File 83(b) election",
        "File Contribution Agreement",
        "Update Shareholders Registers & Accounts",
        "Schedule Reminder for Delaware Tax Compliance"
      ],
      documents: []
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
      infos[:documents].each do |doc|
        Document.create!(name: doc, project: @project)
      end
    end
  end
end
