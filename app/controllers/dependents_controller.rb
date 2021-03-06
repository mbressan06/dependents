class DependentsController < ApplicationController
  before_action :set_dependent, only: [:show, :edit, :update, :destroy]
  before_action :user_login, only: [:show, :new, :create, :edit, :destroy]

# GET /dependents
  # GET /dependents.json
  def index
    if current_user
      @dependents = Dependent.all
    else
      redirect_to new_user_session_path
    end
  end
# GET /dependents/1
  # GET /dependents/1.json
  def show
  end
# GET /dependents/new
  def new
    @dependent = Dependent.new
  end
# GET /dependents/1/edit
  def edit
  end
# POST /dependents
  # POST /dependents.json
  def create
    @dependent = Dependent.new(dependent_params)
    @dependent.user_id = current_user.id
    respond_to do |format|
      if @dependent.save
        format.html { redirect_to @dependent, notice: 'Dependent was successfully created.' }
        format.json { render :show, status: :created, location: @dependent }
      else
        format.html { render :new }
        format.json { render json: @dependent.errors, status: :unprocessable_entity }
      end
    end
  end
# PATCH/PUT /dependents/1
  # PATCH/PUT /dependents/1.json
  def update
    respond_to do |format|
      if @dependent.update(dependent_params)
        format.html { redirect_to @dependent, notice: 'Dependent was successfully updated.' }
        format.json { render :show, status: :ok, location: @dependent }
      else
        format.html { render :edit }
        format.json { render json: @dependent.errors, status: :unprocessable_entity }
      end
    end
  end
# DELETE /dependents/1
  # DELETE /dependents/1.json
  def destroy
    @dependent.destroy
    respond_to do |format|
      format.html { redirect_to dependents_url, notice: 'Dependent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private

    def user_login
      unless current_user.present?
        flash[:notice] = 'Você precisa efetuar o login antes de cadastrar um produto.'
        redirect_to root_path
      end
      puts action_name
      if action_name == 'edit' or action_name == 'destroy' or action_name == 'show' or action_name == 'new'
        flash[:notice] = 'Você não é o responsável pelo cadastro.'
        #redirect_to root_path if @dependent.user_id != current_user.id
      end
    end
# Use callbacks to share common setup or constraints between actions.
    def set_dependent
      @dependent = Dependent.find(params[:id])
    end
# Never trust parameters from the scary internet, only allow the white list through.
    def dependent_params
      params.require(:dependent).permit(:name, :kinship_type, :image)
    end
end
