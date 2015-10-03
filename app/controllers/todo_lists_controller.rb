class TodoListsController < ApplicationController
  def index
    redirect_to TodoList.first
  end

  def show
    @todo_list = TodoList.find(params[:id])
    @todo = Todo.new
  end
end
