//
//  TodoServiceMock.swift
//  GetirTodoTests
//
//  Created by Veli Bacik on 1/14/21.
//

@testable import Todo

class TodoServiceMock: TodoServiceProtocol {

    func fetchTodoItems(onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void) {
        onSuccess([Todo(subTitle: "ok", title: "ok2")])
    }

    func removeTodoItem(id: String, onSuccess: @escaping (EmptyModel?) -> Void, onError: @escaping (BaseError) -> Void) {
        onSuccess(EmptyModel())
    }

    func addTodoItem(item: Todo, index: Int, onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void) {
        onSuccess([item, Todo(subTitle: "ok", title: "ok2"), Todo(subTitle: "ok", title: "ok2")])
    }

    func updateTodoItem(item: Todo, index: Int, onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void) {
        var _item = item
        _item.update(title: "updated", subTitle: "updated")
        onSuccess([_item, Todo(subTitle: "ok", title: "ok2"), Todo(subTitle: "ok", title: "ok2")])
    }
}
