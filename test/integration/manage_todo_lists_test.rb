require "test_helper"

class ManageTodoListsTest < ActionDispatch::IntegrationTest
  test "display todo list page" do
    list = todo_lists(:one)

    visit root_path

    assert page.has_content?(list.name)
  end
end
