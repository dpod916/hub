class LocalOperatingUnitsController < ApplicationController
  before_action :set_local_operating_unit, only: [:show, :edit, :update, :destroy]

  # GET /local_operating_units
  # GET /local_operating_units.json
  def index
    @local_operating_units = LocalOperatingUnit.all
  end

  # GET /local_operating_units/1
  # GET /local_operating_units/1.json
  def show
  end

  # GET /local_operating_units/new
  def new
    @local_operating_unit = LocalOperatingUnit.new
  end

  # GET /local_operating_units/1/edit
  def edit
  end

  # POST /local_operating_units
  # POST /local_operating_units.json
  def create
    @local_operating_unit = LocalOperatingUnit.new(local_operating_unit_params)

    respond_to do |format|
      if @local_operating_unit.save
        format.html { redirect_to @local_operating_unit, notice: 'Local operating unit was successfully created.' }
        format.json { render :show, status: :created, location: @local_operating_unit }
      else
        format.html { render :new }
        format.json { render json: @local_operating_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_operating_units/1
  # PATCH/PUT /local_operating_units/1.json
  def update
    respond_to do |format|
      if @local_operating_unit.update(local_operating_unit_params)
        format.html { redirect_to @local_operating_unit, notice: 'Local operating unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @local_operating_unit }
      else
        format.html { render :edit }
        format.json { render json: @local_operating_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_operating_units/1
  # DELETE /local_operating_units/1.json
  def destroy
    @local_operating_unit.destroy
    respond_to do |format|
      format.html { redirect_to local_operating_units_url, notice: 'Local operating unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_operating_unit
      @local_operating_unit = LocalOperatingUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_operating_unit_params
      params.require(:local_operating_unit).permit(:lei, :name, :record_count, :content_data, :last_attempted_download_date, :last_successful_download_date, :last_valid_download_date)
    end
end
