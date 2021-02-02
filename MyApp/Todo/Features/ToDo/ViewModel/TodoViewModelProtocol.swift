//
//  TodoViewModelProtocol.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//

import Foundation

protocol TodoViewModelProtocol {
    associatedtype T
    var isLoading: Bool { get }
    var todoItems: [T] { get }
    var todoService: TodoServiceProtocol { get }
    func fetchTodoItems()
    func addItem(item: Todo)
    func removeTodoItem(id: Int)
    func updateItem(item: Todo, index: Int)
}
