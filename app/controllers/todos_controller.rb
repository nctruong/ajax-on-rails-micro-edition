class TodosController < ApplicationController
  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo = @todo_list.todos.build(todo_params)

    if @todo.save
      redirect_to root_path
    else
      render "todo_lists/show"
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name)
  end
end
