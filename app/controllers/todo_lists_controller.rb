class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update]

  def index
    redirect_to TodoList.first
  end

  def show
    @todo = Todo.new
  end

  def edit
  end

  def update
    unless @todo_list.update(todo_list_params)
      render "edit"
    end
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:name)
  end
end
