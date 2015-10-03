require 'test_helper'

class TodoListsControllerTest < ActionController::TestCase
  def setup
    @todo_list = todo_lists(:todo_list)
  end

  test "index redirects to the first todo_list" do
    get :index

    assert_redirected_to todo_list_path(TodoList.first)
  end

  test "should get show" do
    get :show, id: @todo_list.id

    assert_select "h1", @todo_list.name
  end

  test "show edit modal" do
    xhr :get, :edit, id: @todo_list.id

    assert_match "#modal", response.body
  end

  test "update todo list" do
    xhr :patch, :update, id: @todo_list.id, todo_list: { name: "New Name" }

    @todo_list.reload

    assert_equal "New Name", @todo_list.name
  end

  test "update todo list with invalid data" do
    xhr :patch, :update, id: @todo_list.id, todo_list: { name: "" }

    @todo_list.reload

    assert_match "form-errors", response.body
  end
end
