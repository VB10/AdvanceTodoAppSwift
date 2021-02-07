//
//  TodoService.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//
import Alamofire

final class TodoService: NetworkManagerProtocol, TodoServiceProtocol {
    
    func addTodoItem(item: Todo, index: Int, onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void) {
        service.fetch(path: "\(NetworkPath.TODO.rawValue)/\(index)", paramaters: nil, data: item, method: HTTPMethod.put) { (response: BaseResponse<[Todo]>) in
            onSuccess(response.model)
        } onError: { (error) in
            onError(error)
        }
    }

    func updateTodoItem(item: Todo, index: Int, onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void) {
        service.fetch(path: "\(NetworkPath.TODO.rawValue)/\(index)", paramaters: nil, data: item, method: HTTPMethod.put) { (response: BaseResponse<[Todo]>) in
            onSuccess(response.model)
        } onError: { (error) in
            onError(error)
        }
    }

    func removeTodoItem(id: String, onSuccess: @escaping (EmptyModel?) -> Void, onError: @escaping (BaseError) -> Void) {
        service.fetch(path: "\(NetworkPath.TODO.rawValue)/\(id)", paramaters: nil, data: nil, method: HTTPMethod.delete) { (response: BaseResponse<EmptyModel>) in
            onSuccess(response.model)
        } onError: { (error) in
            onError(error)
        }
    }


    func fetchTodoItems(onSuccess: @escaping ([Todo]?) -> Void, onError: @escaping (BaseError) -> Void) {
        service.fetch(path: NetworkPath.TODO.rawValue, paramaters: nil, data: nil, method: HTTPMethod.get) { (response: BaseResponse<[Todo]>) in
            onSuccess(response.model)
        } onError: { (error) in
            onError(error)
        }
    }
}
