require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  def setup
    @todo_list = todo_lists(:todo_list)
  end

  test "create a todo" do
    assert_difference "Todo.count", 1 do
      xhr :post, :create, todo_list_id: @todo_list.id, todo: { name: "My first todo" }
    end

    todo = Todo.last
    assert_equal "My first todo", todo.name
    assert_equal @todo_list, todo.todo_list
  end

  test "create a todo with invalid data" do
    xhr :post, :create, todo_list_id: @todo_list.id, todo: { name: "" }

    assert_response :ok
  end

  test "toggle todo" do
    todo = todos(:uncompleted)

    xhr :post, :toggle, id: todo.id

    todo.reload
    assert todo.completed?
  end

  test "delete todo" do
    todo = todos(:uncompleted)

    assert_difference "Todo.count", -1 do
      xhr :delete, :destroy, id: todo.id
    end
  end
end
