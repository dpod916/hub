class LegalEntitiesController < ApplicationController
  before_action :set_legal_entity, only: [:show, :edit, :update, :destroy]

  # GET /legal_entities
  # GET /legal_entities.json
  def index
    @legal_entities = LegalEntity.all
  end

  # GET /legal_entities/1
  # GET /legal_entities/1.json
  def show
  end

  # GET /legal_entities/new
  def new
    @legal_entity = LegalEntity.new
  end

  # GET /legal_entities/1/edit
  def edit
  end

  # POST /legal_entities
  # POST /legal_entities.json
  def create
    @legal_entity = LegalEntity.new(legal_entity_params)

    respond_to do |format|
      if @legal_entity.save
        format.html { redirect_to @legal_entity, notice: 'Legal entity was successfully created.' }
        format.json { render :show, status: :created, location: @legal_entity }
      else
        format.html { render :new }
        format.json { render json: @legal_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legal_entities/1
  # PATCH/PUT /legal_entities/1.json
  def update
    respond_to do |format|
      if @legal_entity.update(legal_entity_params)
        format.html { redirect_to @legal_entity, notice: 'Legal entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @legal_entity }
      else
        format.html { render :edit }
        format.json { render json: @legal_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legal_entities/1
  # DELETE /legal_entities/1.json
  def destroy
    @legal_entity.destroy
    respond_to do |format|
      format.html { redirect_to legal_entities_url, notice: 'Legal entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_entity
      @legal_entity = LegalEntity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legal_entity_params
      params.require(:legal_entity).permit(:lei, :legal_name, :business_register_entity_id, :legal_jurisdiction, :legal_form, :entity_status)
    end
end
