class OperatingCompaniesController < ApplicationController
  before_action :set_operating_company, only: [:show, :edit, :update, :destroy]

  # GET /operating_companies
  # GET /operating_companies.json
  def index
    items = OperatingCompany.includes(:profile)
    respond_to do |format|
      format.html { render "layouts/index", locals: {items: @items, items_name: 'operating_companies'}  }
      format.json { render json: @items.tokens(params[:q]) }
    end
  end

  # GET /operating_companies/1
  # GET /operating_companies/1.json
  def show
     @activities = @operating_company.group_activities
                      .paginate(:page => params[:page], :per_page => 10000)
                      .group_by {|t| t.created_at.to_date }
    respond_to do |format|
      format.html { render "layouts/show", locals: {item: @operating_company}  }
      format.json
    end
  end

  # GET /operating_companies/new
  def new
    @operating_company = OperatingCompany.new
  end

  # GET /operating_companies/1/edit
  def edit
  end

  # POST /operating_companies
  # POST /operating_companies.json
  def create
    @operating_company = OperatingCompany.new(operating_company_params)

    respond_to do |format|
      if @operating_company.save
        format.html { redirect_to @operating_company, notice: 'Operating company was successfully created.' }
        format.json { render :show, status: :created, location: @operating_company }
      else
        format.html { render :new }
        format.json { render json: @operating_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operating_companies/1
  # PATCH/PUT /operating_companies/1.json
  def update
    respond_to do |format|
      if @operating_company.update(operating_company_params)
        format.html { redirect_to @operating_company, notice: 'Operating company was successfully updated.' }
        format.json { render :show, status: :ok, location: @operating_company }
      else
        format.html { render :edit }
        format.json { render json: @operating_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operating_companies/1
  # DELETE /operating_companies/1.json
  def destroy
    @operating_company.destroy
    respond_to do |format|
      format.html { redirect_to operating_companies_url, notice: 'Operating company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operating_company
      @operating_company = OperatingCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operating_company_params
      params.require(:operating_company).permit(:name)
    end
end
