class CreateStepsAndTasksForProject
  STEPS_AND_TASKS = {
    "Create Project" => {
      deadline: 29,
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
      tasks: [
        "Draft flip Pro-forma model",
        "Determine the valuation of the company",
        "Consult tax team"
      ],
      documents: []
    },

    "U.S Corporation" => {
      deadline: 20,
      tasks: [
        "Draft Incorporation Documents",
        "File Certificate of Incorporation"
      ],
      documents: [
        "πΊπΈ Certificate of Incorporation",
        "πΊπΈ Bylaws",
        "πΊπΈ Action of Incorporator",
        "πΊπΈ Initial Board Consent",
        "πΊπΈ Stockholders Consent",
        "πΊπΈ Indemnification Agreements"
      ]
    },

    "EIN and U.S. Bank Account" => {
      deadline: 15,
      tasks: [
        "Create bank account"
      ],
      documents: []
    },

    "Flip" => {
      deadline: 10,
      tasks: [
        "Draft Flip Documents"
      ],
      documents: [
        "πΊπΈ Board Consent",
        "πΊπΈ Stock Restriction Agreements",
        "πΊπΈ Securities Exchange Agreement",
        "π«π· Contribution Agreement",
        "π«π· Share Transfer Form",
        "π«π· Shareholders Individual Account",
        "π«π· Intellectual Property Agreements"
      ]
    },

    "Closing" => {
      deadline: 05,
      tasks: [
        "Invite signatories to sign"
      ],
      documents: []
    },

    "Post-Closing" => {
      deadline: 03,
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

# icons
# icon: "fa-solid fa-hands-holding-circle",
# icon: "fa-solid fa-paper-plane",
# icon: "fa-solid fa-shuttle-space",
# icon: "fa-solid fa-burger",
# icon: "fa-solid fa-piggy-bank",
# icon: "fa-solid fa-building",
# icon: "fa-solid fa-circle-play",
