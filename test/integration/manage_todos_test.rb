require 'test_helper'

class ManageTodosTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.current_driver = :webkit
  end

  def teardown
    Capybara.current_driver = :rack_test
  end

  test "create a todo" do
    visit root_path

    fill_in :todo_name, with: "My first todo item"
    click_button "Create Todo"

    assert page.has_content?("My first todo item")
  end
end
