class DashboardController < ApplicationController
  before_action :require_authentication

  def index
    @profile = Current.user.profile
    @plan = Current.user.plans.order(created_at: :desc).first
    @latest_progress =
      Current.user.progress_measurements.order(measured_at: :desc).first
  end
end