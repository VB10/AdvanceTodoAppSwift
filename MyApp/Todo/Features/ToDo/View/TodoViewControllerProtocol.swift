//
//  TodoViewControllerProtocol.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//

protocol TodoViewControllerProtocol: AnyObject {
    func changeLoading(value: Bool)
    func updateTableView(items: [Todo])
    func navigateToDetail(item: Todo, selectedIndex: Int)
    func showError(description: String)
}
