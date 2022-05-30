class Task < ApplicationRecord
  belongs_to :project
  belongs_to :team_member
end
