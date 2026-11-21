class DashboardController < ApplicationController
  def show
    companies = Company.all.order(created_at: "DESC")
  end
end
