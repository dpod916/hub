class ProfitCentersController < ApplicationController
  before_action :set_profit_center, only: [:show, :edit, :update, :destroy]

  # GET /profit_centers
  # GET /profit_centers.json
  def index
    items = ProfitCenter.includes(:profile)
    respond_to do |format|
      format.html { render "layouts/index", locals: {items: items, items_name: 'profit_centers'}  }
      format.json { render json: @items.tokens(params[:q]) }
    end
  end

  # GET /profit_centers/1
  # GET /profit_centers/1.json
  def show
     @activities = @profit_center.group_activities
                      .paginate(:page => params[:page], :per_page => 10000)
                      .group_by {|t| t.created_at.to_date }
    respond_to do |format|
      format.html { render "layouts/show", locals: {item: @profit_center}  }
      format.json
    end
  end

  # GET /profit_centers/new
  def new
    @profit_center = ProfitCenter.new
  end

  # GET /profit_centers/1/edit
  def edit
  end

  # POST /profit_centers
  # POST /profit_centers.json
  def create
    @profit_center = ProfitCenter.new(profit_center_params)

    respond_to do |format|
      if @profit_center.save
        format.html { redirect_to @profit_center, notice: 'Profit center was successfully created.' }
        format.json { render :show, status: :created, location: @profit_center }
      else
        format.html { render :new }
        format.json { render json: @profit_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profit_centers/1
  # PATCH/PUT /profit_centers/1.json
  def update
    respond_to do |format|
      if @profit_center.update(profit_center_params)
        format.html { redirect_to @profit_center, notice: 'Profit center was successfully updated.' }
        format.json { render :show, status: :ok, location: @profit_center }
      else
        format.html { render :edit }
        format.json { render json: @profit_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profit_centers/1
  # DELETE /profit_centers/1.json
  def destroy
    @profit_center.destroy
    respond_to do |format|
      format.html { redirect_to profit_centers_url, notice: 'Profit center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profit_center
      @profit_center = ProfitCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profit_center_params
      params.require(:profit_center).permit(:name)
    end
end
