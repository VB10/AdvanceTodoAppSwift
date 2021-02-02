//
//  TodoModel.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//

struct Todo: Codable {
    var subTitle, title: String

    mutating public func update(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}
