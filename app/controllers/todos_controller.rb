class TodosController < ApplicationController
  def index
    @todo = Todo.new
  end
  
  def new 
  end
  def create
    @todo= Todo.new(todo_params)
    if @todo.save
      flash[:notice]= "Todo was created successfully"
      redirect_to todo_path(@todo)
    else
      render 'index'
    end
  end
  
  
  def show
    @todo= Todo.find(params[:id])
  end
  
  private
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
