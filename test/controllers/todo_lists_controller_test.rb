require 'test_helper'

class TodoListsControllerTest < ActionController::TestCase
  test "index redirects to the first todo_list" do
    get :index

    assert_redirected_to todo_list_path(TodoList.first)
  end

  test "should get show" do
    todo_list = todo_lists(:todo_list)

    get :show, id: todo_list.id

    assert_select "h1", todo_list.name
  end
end
