require "test_helper"

class ManageTodoListsTest < ActionDispatch::IntegrationTest
  test "display todo list page" do
    list = todo_lists(:todo_list)

    visit root_path

    assert page.has_content?(list.name)
  end
end
