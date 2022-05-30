class Step < ApplicationRecord
  has_many :tasks
  belongs_to :user
  belongs_to :project
end
