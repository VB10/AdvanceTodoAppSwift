//
//  TodoDataSource.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//

import UIKit

final class TodoTableViewProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var todoItemms: [Todo]
    var delegate: TodoTableViewProtocol?

    init(todoItemms: [Todo]) {
        self.todoItemms = todoItemms
        super.init()
    }

    func updateItems(todoItemms: [Todo]) {
        self.todoItemms = todoItemms
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItemms.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = todoItemms[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(item: todoItemms[indexPath.row], index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegate?.removeItem(item: todoItemms[indexPath.row],index: indexPath.row)
        }
    }

}
