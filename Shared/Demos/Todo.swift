//
//  Todo.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI

struct Todo: View {
    
    var body: some View {
        NavigationView {
            TodoSideMenu()
            TaskListView()
        }
    }
}

struct Task: Hashable, Identifiable {
    var id = UUID()
    var title: String
    var completed = false
    
    var icon: String {
        completed ? "largecircle.fill.circle" : "circle"
    }
    var titleColor: Color {
        completed ? .secondary : .primary
    }
}

struct TaskListView: View {
    @State private var tasks = [
        Task(title: "Here’s to the crazy ones"),
        Task(title: "the misfits, the rebels, the troublemakers", completed: true),
        Task(title: "the round pegs in the square holes…"),
        Task(title: "the ones who see things differently — they’re not fond of rules…"),
        Task(title: "You can quote them, disagree with them, glorify or vilify them"),
        Task(title: "but the only thing you can’t do is ignore them because they change things…"),
        Task(title: "they push the human race forward", completed: true),
        Task(title: "and while some may see them as the crazy ones"),
        Task(title: "we see genius", completed: true),
        Task(title: "because the ones who are crazy enough to think that they can change the world"),
        Task(title:  "are the ones who do.")
    ]

    var body: some View {
        List {
            VStack {
                Text("Tasks")
                    .font(.headline)
                ForEach(tasks, id: \.id) { task in
                    TaskView(task: task)
                }
            }
        }
        .navigationTitle("Todo")
        .toolbar {
            ToolbarItem(placement: .status) {
                Button {
                    tasks.append(Task(title: "New Task"))
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

struct TaskView: View {
    @State var task: Task
    
    var body: some View {
        Button {
            task.completed.toggle()
        } label: {
            HStack {
                Image(systemName: task.icon)
                    .foregroundColor(.secondary)
                Text(task.title)
                    .strikethrough(task.completed, color: Color.secondary)
                    .foregroundColor(task.titleColor)
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TodoSideMenu: View {
    @State private var selection: Set<Int> = [0]
    
    var body: some View {
        List(selection: $selection) {
            Label("Tasks", systemImage: "laargecircle.fill")
            Label("Today", systemImage: "star.fill")
            Label("Upcoming", systemImage: "calendar")
            
            Divider()
            
            Label("Activity", systemImage: "clock.fill")
            Label("Trash", systemImage: "trash.fill")
            
            Divider()
            
            Label("New List", systemImage: "plus")
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth:100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
    }
}

struct Todo_Previews: PreviewProvider {
    static var previews: some View {
        Todo()
    }
}
