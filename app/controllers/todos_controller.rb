class TodosController < ApplicationController
  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo = @todo_list.todos.build(todo_params)

    unless @todo.save
      head :ok
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name)
  end
end
