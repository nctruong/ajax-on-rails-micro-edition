TodoList.destroy_all

todo_list = TodoList.create!(name: "My awesome Todo list!")

todo_list.todos.create!(name: "I am first!")
todo_list.todos.create!(name: "Complete me, please!")
todo_list.todos.create!(name: "Haha, done!", completed: true)
