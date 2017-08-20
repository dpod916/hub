class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :through => :current_user
  load_and_authorize_resource :taskable
  load_and_authorize_resource :task, :through => :taskable

  # GET /tasks
  # GET /tasks.json
  def index
    items = Task.includes(:profile, {taskable: :profile})
    respond_to do |format|
      format.html { render "layouts/index", locals: {items: items, items_name: 'tasks'}  }
      format.json { render json: @items.tokens(params[:q]) }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @activities = @task.get_activities
                      .paginate(:page => params[:page], :per_page => 10000)
                      .group_by {|t| t.created_at.to_date }
    respond_to do |format|
      format.html { render "layouts/show_item", locals: {item: @task}  }
      format.json
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:date, :time, :name, :title,
                                   :owner_tokens, :participant_tokens,
                                   :admin_tokens, :contact_tokens,
                                   :subject_tokens, :reviewer_tokens)
    end
end