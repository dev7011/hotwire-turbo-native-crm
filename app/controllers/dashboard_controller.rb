class DashboardController < ApplicationController
  def show
    companies = Company.all.order(created_at: "DESC")
  end

  def contacts
    @contacts = Contact.all.order(created_at: "DESC")
  end
end
