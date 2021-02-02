//
//  BaseResponse.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//

struct BaseResponse<T : Codable> {
    var model: T?
    var message: String?
}
