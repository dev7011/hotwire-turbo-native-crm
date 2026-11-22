class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  def index
    @companies = Company.all.order(created_at: "DESC")
  end

  def show

  end

  def new
    @company = Company.new
  end

  def edit

  end

  def create
    @company = Company.new(company_params)

    if @company.save
      respond_to do |format|
        format.turbo_stream
        format.html {
          redirect_to @company,
                      notice: "Company was successfully created."
        }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      redirect_to :companies_path, notice: "Company created successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path,
                notice: "Company deleted successfully.",
                status: :see_other
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name,
      :website,
      :industry,
      :phone,
      :email,
      :address
    )
  end
end
