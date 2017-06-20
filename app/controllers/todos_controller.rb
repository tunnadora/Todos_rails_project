class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json

  def assign_todos
    @todos = Todo.all
    

  end




  def index

    @sprint = Sprint.find(params[:sprint_id])
    @todos = Todo.all.where(sprint_id:@sprint.id)
    
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    
    @users= User.all
    @sprint = Sprint.find(params[:sprint_id]) 
    @todo = Todo.new

  end

  # GET /todos/1/edit
  def edit
  
  @sprint = Sprint.find(params[:sprint_id]) 
        
  end

  # POST /todos
  # POST /todos.json
  def create
    
    #@sprint = Sprint.find(params[:sprint_id]) 
    @todo = Todo.new(todo_params)
    

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    sp_id=@todo.sprint_id
    
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_path(sprint_id: sp_id), notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
      @users= User.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:name, :state_date, :description, :assignuser, :user_id, :status, :sprint_id)
    end
end
