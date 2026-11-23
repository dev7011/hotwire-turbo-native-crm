class ContactsController < ApplicationController
  before_action :set_company
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = @company.contacts.all
  end

  # GET /contacts/1 or /contacts/1.json
  def show

  end

  # GET /contacts/new
  def new
    @contact = @company.contacts.new()
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = @company.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.turbo_stream
        format.html { redirect_to @contact, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @contact.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.turbo_stream
        format.html { redirect_to @contact, notice: "Contact was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.turbo_stream { render :edit, status: :unprocessable_entity }
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @contact.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to contacts_path, notice: "Contact was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    def set_company
      @company = Company.find(params[:company_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = @company.contacts.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(
        :first_name,
        :last_name,
        :email,
        :phone,
        :position
      )
    end
end
