TodoList.destroy_all

todo_list = TodoList.create!(name: "My awesome Todo list!")

todo_list.todos.create!(name: "I am first!")
todo_list.todos.create!(name: "Complete me, please!")
todo_list.todos.create!(name: "Better be third, than forth")
todo_list.todos.create!(name: ":(")
todo_list.todos.create!(name: "Haha, done!", completed: true)
todo_list.todos.create!(name: "Me too!", completed: true)
