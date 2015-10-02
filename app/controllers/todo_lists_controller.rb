class TodoListsController < ApplicationController
  def show
    @todo_list = TodoList.first
  end
end
