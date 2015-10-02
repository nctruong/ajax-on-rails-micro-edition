class TodoList < ActiveRecord::Base
  has_many :todos, dependent: :destroy
  has_many :completed_todos, -> { where(completed: true).by_position }, class_name: "Todo"
  has_many :uncompleted_todos, -> { where(completed: false).by_position }, class_name: "Todo"

  validates :name, presence: true
end
