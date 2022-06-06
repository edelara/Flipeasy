class CalendarsController < ApplicationController
  def show
    skip_authorization
    start_date = params.fetch(:start_date, Date.today).to_date
    @projects = Project.where(start_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

end
