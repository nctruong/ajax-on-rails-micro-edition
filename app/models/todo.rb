class Todo < ActiveRecord::Base
  belongs_to :todo_list

  validates :name, :todo_list, presence: true

  scope :completed, -> { where completed: true }
  scope :uncompleted, -> { where completed: false }
end
