require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  def setup
    @todo_list = todo_lists(:one)
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
    post :create, todo_list_id: @todo_list.id, todo: { name: "" }

    assert_response :ok
  end
end
