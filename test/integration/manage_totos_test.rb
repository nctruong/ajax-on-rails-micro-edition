require 'test_helper'

class ManageTotosTest < ActionDispatch::IntegrationTest
  test "create a todo" do
    visit root_path

    fill_in :todo_name, with: "My first todo item"
    click_button "Create Todo"

    assert page.has_content?("My first todo item")
  end
end
