//
//  TodoTableViewProtocol.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//


protocol TodoTableViewProtocol {
    func removeItem(item: Todo,index: Int)
    func didSelect(item:Todo,index: Int)
}
