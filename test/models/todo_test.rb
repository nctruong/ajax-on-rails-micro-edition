require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "todo completed" do
    todo = todos(:uncompleted)
    todo_list = todo.todo_list

    3.times do
      todo_list.todos.create!(name: "todo", completed: false)
      todo_list.todos.create!(name: "todo", completed: true)
    end

    todo.toggle_completed!
    assert_equal todo, todo_list.completed_todos.first

    todo.toggle_completed!
    assert_equal todo, todo_list.uncompleted_todos.last
  end
end
