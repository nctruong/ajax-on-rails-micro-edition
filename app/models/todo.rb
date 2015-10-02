class Todo < ActiveRecord::Base
  belongs_to :todo_list

  acts_as_list scope: [:todo_list_id, :completed]

  validates :name, :todo_list, presence: true

  scope :by_position, -> { order :position }
  scope :completed, -> { where completed: true }
  scope :uncompleted, -> { where completed: false }

  def toggle_completed!
    toggle!(:completed)
    move_to_top if completed?
  end
end
