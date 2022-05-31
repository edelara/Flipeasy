class ProjectsController < ApplicationController
  def index
    @projects = policy_scope(Project)
  end
end
