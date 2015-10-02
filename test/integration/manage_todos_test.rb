require 'test_helper'

class ManageTodosTest < ActionDispatch::IntegrationTest
  def setup
    @todo = todos(:uncompleted)
    Capybara.current_driver = :webkit
  end

  def teardown
    Capybara.current_driver = :rack_test
  end

  test "create todo" do
    visit root_path

    fill_in :todo_name, with: "My first todo item"
    page.execute_script("$('form').submit();");

    assert page.has_content?("My first todo item")
  end

  test "edit todo" do
    visit root_path

    find("#todo_#{@todo.id}").hover
    within "#todo_#{@todo.id}" do
      click_link "Edit"

      fill_in :todo_name, with: "New name"
      click_button "Save"

      assert page.has_content?("New name")
    end
  end

  test "cancel editing" do
    visit root_path

    find("#todo_#{@todo.id}").hover
    within "#todo_#{@todo.id}" do
      click_link "Edit"
      click_link "Cancel"

      assert page.has_no_css?("form")
    end
  end

  test "complete todo" do
    visit root_path

    assert_difference "all('.completed li').count", 1 do
      assert_difference "all('.uncompleted li').count", -1 do
        within "#todo_#{@todo.id}" do
          find('input[type="checkbox"]').click
          sleep 0.1
        end
      end
    end
  end

  test "delete todo" do
    visit root_path

    find("#todo_#{@todo.id}").hover
    within "#todo_#{@todo.id}" do
      click_link "Delete"
    end

    assert page.has_no_css?("#todo_#{@todo.id}")
  end
end
