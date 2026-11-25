class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  def index
    @companies = Company.all.order(created_at: "desc")
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

    respond_to do |format|
      if @company.save
        format.turbo_stream
        format.html {
          redirect_to @company, notice: "Company was successfully created."
        }
      else
        format.turbo_stream { render :edit }
        format.html {
            render :new, status: :unprocessable_entity
        }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
          format.turbo_stream
          format.html { redirect_to :companies_path, notice: "Company created successfully." }
      else
          format.turbo_stream
          format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy

    respond_to do |format|
      format.turbo_stream
      format.html {
        redirect_to companies_path,
                    notice: "Company deleted successfully.",
                    status: :see_other
      }
    end
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
