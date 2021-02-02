//
//  TodoServiceProtocol.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//

protocol TodoServiceProtocol {
    func fetchTodoItems(onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void)
    func removeTodoItem(id: String, onSuccess: @escaping (EmptyModel?) -> Void, onError: @escaping (BaseError) -> Void)
    func addTodoItem(item: Todo, index: Int, onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void)
    func updateTodoItem(item: Todo, index: Int, onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void)
}
