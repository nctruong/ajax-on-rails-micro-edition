class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :cancel_edit, :update, :destroy, :toggle]

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo = @todo_list.todos.build(todo_params)

    unless @todo.save
      head :ok
    end
  end

  def edit
  end

  def cancel_edit
    render "update"
  end

  def update
    unless @todo.update(todo_params)
      head :ok
    end
  end

  def destroy
    @todo.destroy
  end

  def toggle
    @todo.toggle_completed!
  end

  private

  def todo_params
    params.require(:todo).permit(:name)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
