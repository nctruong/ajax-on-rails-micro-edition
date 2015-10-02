require 'test_helper'

class ManageTodosTest < ActionDispatch::IntegrationTest
  def setup
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

  test "complete todo" do
    todo = todos(:uncompleted)

    visit root_path

    assert_difference "all('.completed li').count", 1 do
      assert_difference "all('.uncompleted li').count", -1 do
        within "#todo_#{todo.id}" do
          find('input[type="checkbox"]').click
          sleep 0.1
        end
      end
    end
  end

  test "delete todo" do
    todo = todos(:uncompleted)

    visit root_path

    find("#todo_#{todo.id}").hover
    within "#todo_#{todo.id}" do
      click_link "Delete"
    end

    assert page.has_no_css?("#todo_#{todo.id}")
  end
end
