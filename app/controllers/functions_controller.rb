class FunctionsController < ApplicationController
  before_action :set_function, only: [:show, :edit, :update, :destroy]

  # GET /functions
  # GET /functions.json
  def index
    items = Function.includes(:profile)
    respond_to do |format|
      format.html { render "layouts/index", locals: {items: items, items_name: 'functions'}  }
      format.json { render json: @items.tokens(params[:q]) }
    end
  end

  # GET /functions/1
  # GET /functions/1.json
  def show
     @activities = @function.group_activities
                      .paginate(:page => params[:page], :per_page => 10000)
                      .group_by {|t| t.created_at.to_date }
    respond_to do |format|
      format.html { render "layouts/show", locals: {item: @function}  }
      format.json
    end
  end

  # GET /functions/new
  def new
    @function = Function.new
  end

  # GET /functions/1/edit
  def edit
  end

  # POST /functions
  # POST /functions.json
  def create
    @function = Function.new(function_params)

    respond_to do |format|
      if @function.save
        format.html { redirect_to @function, notice: 'Function was successfully created.' }
        format.json { render :show, status: :created, location: @function }
      else
        format.html { render :new }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /functions/1
  # PATCH/PUT /functions/1.json
  def update
    respond_to do |format|
      if @function.update(function_params)
        format.html { redirect_to @function, notice: 'Function was successfully updated.' }
        format.json { render :show, status: :ok, location: @function }
      else
        format.html { render :edit }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functions/1
  # DELETE /functions/1.json
  def destroy
    @function.destroy
    respond_to do |format|
      format.html { redirect_to functions_url, notice: 'Function was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function
      @function = Function.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def function_params
      params.require(:function).permit(:name)
    end
end
