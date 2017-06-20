class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]

  # GET /sprints
  # GET /sprints.json
  def index

    @organization = Organization.find(params[:organization_id])
    @sprints = Sprint.all.where(organization_id:@organization.id)
    

            if User.where(organization_id:@organization.id).count==0
                    redirect_to nouser_path( organization_id: @organization.id) 
            
            end

   end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
  end

  # GET /sprints/new
  def new
    
    @organization = Organization.find(params[:organization_id])
    @sprint = Sprint.new
    
  end

  # GET /sprints/1/edit
  def edit
    
    @organization = Organization.find(params[:organization_id])
  end

  # POST /sprints
  # POST /sprints.json
  def create
     
    @sprint = Sprint.new(sprint_params)

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to @sprint, notice: 'Sprint was successfully created.' }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to @sprint, notice: 'Sprint was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy

    or_id=@sprint.organization_id

    @sprint.destroy
    respond_to do |format|
      format.html { redirect_to sprints_path(organization_id: or_id), notice: 'Sprint was successfully destroyed.' }
      #format.html { redirect_to sprints_url, notice: 'Sprint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_params
      params.require(:sprint).permit(:version,:organization_id)
    end
end
