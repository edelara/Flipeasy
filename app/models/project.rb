class Project < ApplicationRecord
  belongs_to :team_member
  belongs_to :company
  belongs_to :user
end
