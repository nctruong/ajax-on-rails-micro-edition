require "test_helper"

class ManageTodoListsTest < ActionDispatch::IntegrationTest
  test "display todo list page" do
    list = todo_lists(:todo_list)

    visit root_path

    assert page.has_content?(list.name)
  end

  def test_edit_todo_list
    Capybara.current_driver = :webkit

    visit root_path

    click_link "Settings"
    within "#modal" do
      fill_in "Name", with: "New Name"
      click_button "Save"
    end

    page.assert_selector("h1", text: "New Name")
  ensure
    Capybara.current_driver = :rack_test
  end
end
