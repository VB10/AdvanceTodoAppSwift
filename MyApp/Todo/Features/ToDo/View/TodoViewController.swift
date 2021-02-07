//
//  TodoViewController.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//

import UIKit

final class TodoViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    private lazy var alertController: AddTaskAlertController = AddTaskAlertController(title: nil, message: nil, preferredStyle: .alert)
    private var todoItems: [Todo] = []
    lazy var todoDetailViewController: TodoDetailViewController? = TodoDetailViewController.initFromNib()

    lazy var todoTableViewProvider: TodoTableViewProvider = {
        return TodoTableViewProvider(todoItemms: todoItems)
    }()

    lazy var todoViewModel: TodoViewModel<Todo> = {
        return TodoViewModel<Todo>(todoService: TodoService(), delagate: self)
    }()

    @IBAction func addTodoPressed(_ sender: Any) {
        self.present(self.alertController, animated: true, completion: nil)
    }
    @IBAction func onRefreshPressed(_ sender: Any) {
        fethIteems()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alertController.delagate = self
        todoTableView.delegate = todoTableViewProvider
        todoTableView.dataSource = todoTableViewProvider
        todoTableViewProvider.delegate = todoViewModel
        todoDetailViewController?.delegate = self
        fethIteems()
    }

    private func fethIteems() {
        DispatchQueue.global(qos: .background).async {
            self.todoViewModel.fetchTodoItems()
        }
    }
}

extension TodoViewController: TodoViewControllerProtocol {
    func showError(description: String) {

    }

    func changeLoading(value: Bool) {
        DispatchQueue.main.async {
            if value {
                self.loadingIndicator.startAnimating()
            } else {
                self.loadingIndicator.stopAnimating()
                self.loadingIndicator.isHidden = true
            }
        }
    }

    func updateTableView(items: [Todo]) {
        todoTableViewProvider.updateItems(todoItemms: items)
        todoTableView.reloadData()

    }

    func navigateToDetail(item: Todo, selectedIndex: Int) {
        guard let todoDetailViewController = todoDetailViewController else { return }
        todoDetailViewController.todo = item
        todoDetailViewController.selectedIndex = selectedIndex
        DispatchQueue.main.async {
            self.present(todoDetailViewController, animated: true, completion: nil)
        }

    }

}


extension TodoViewController: AddTaskProtocol {
    func onAddItem(item: Todo) {
        todoViewModel.addItem(item: item)
    }
}

extension TodoViewController: TodoDetailProtocol {
    func onUpdate(item: Todo, index: Int) {
        self.todoViewModel.updateItem(item: item, index: index)
    }
}
