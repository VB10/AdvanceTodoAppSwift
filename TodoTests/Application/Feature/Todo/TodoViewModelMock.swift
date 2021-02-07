//
//  TodoViewModelMock.swift
//  TodoTests
//
//  Created by 111542 on 2/7/21.
//

import Foundation
@testable import Todo

class TodoViewModelMock: TodoViewModelProtocol, TodoTableViewProtocol {
    var isLoading: Bool = false

    var todoItems: [Todo] = []

    let todoService: TodoServiceProtocol

    init(service: TodoServiceProtocol) {
        todoService = service
    }


    func fetchTodoItems() {
        isLoading = true
        sleep(1)
        todoService.fetchTodoItems(onSuccess: { (response) in
            if let _todoItems = response {
                self.todoItems = _todoItems
            } else {
                self.todoItems.removeAll()
            }
            self.isLoading = false
        }, onError: { (error) in

            self.isLoading = false

        })
    }

    func addItem(item: Todo) {
        todoService.addTodoItem(item: item, index: 1) { (responses) in
            guard let _ = responses else { return }
            self.todoItems.insert(item, at: 1)
        } onError: { (error) in
            self.todoItems.removeAll()
        }

    }

    func removeTodoItem(id: Int) {
//TODO
    }

    func updateItem(item: Todo, index: Int) {
//TODO
    }


    func removeItem(item: Todo, index: Int) {
//TODO
    }

    func didSelect(item: Todo, index: Int) {
//TODO
    }


}
