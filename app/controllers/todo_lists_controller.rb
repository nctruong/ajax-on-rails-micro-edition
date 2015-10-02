class TodoListsController < ApplicationController
  def show
    @todo_list = TodoList.first
    @todo = Todo.new
  end
end
