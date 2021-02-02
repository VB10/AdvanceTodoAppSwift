//
//  TodoViewModel.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//


final class TodoViewModel<T: Codable>: TodoViewModelProtocol, TodoTableViewProtocol {

    let todoService: TodoServiceProtocol
    var isLoading: Bool = false
    internal var todoItems: [Todo] = []
    weak var delagate: TodoViewControllerProtocol?

    init(todoService: TodoServiceProtocol, delagate: TodoViewControllerProtocol) {
        self.todoService = todoService
        self.delagate = delagate
    }

    func fetchTodoItems() {
        self.delagate?.changeLoading(value: true)
        todoService.fetchTodoItems { [weak self] items in
            guard let self = self, let delagate = self.delagate else { return }
            delagate.changeLoading(value: false)

            guard let items = items else {
                delagate.showError(description: "Not Found")
                return
            }
            self.todoItems = items
            delagate.updateTableView(items: items)
        } onError: { error in
            guard let delagate = self.delagate else { return }

            delagate.showError(description: "Not Found")
            delagate.changeLoading(value: false)

        }

    }

    func removeTodoItem(id: Int) {
        delagate?.changeLoading(value: true)

        todoService.removeTodoItem(id: String(id)) { [weak self] items in
            guard let self = self, let delegate = self.delagate else { return }
            self.todoItems.remove(at: id)

            delegate.updateTableView(items: self.todoItems)
        } onError: { (error) in
            self.delagate?.showError(description: error.debugMessage)
        }
    }

    func removeItem(item: Todo, index: Int) {
        removeTodoItem(id: index)
    }

    func didSelect(item: Todo, index: Int) {
        delagate?.navigateToDetail(item: item, selectedIndex: index)
    }

    func addItem(item: Todo) {
        self.delagate?.changeLoading(value: true)
        todoService.addTodoItem(item: item, index: todoItems.count) { (items) in
            self.todoItems.append(item)
            self.delagate?.changeLoading(value: false)
            self.delagate?.updateTableView(items: self.todoItems)
        } onError: { (error) in
            self.delagate?.showError(description: error.debugMessage)
            self.delagate?.changeLoading(value: false)
        }
    }

    func updateItem(item: Todo, index: Int) {
        self.delagate?.changeLoading(value: true)
        todoService.updateTodoItem(item: item, index: todoItems.count - 1) { (items) in
            self.todoItems[index] = item
            self.delagate?.changeLoading(value: false)
            self.delagate?.updateTableView(items: self.todoItems)
        } onError: { (error) in
            self.delagate?.showError(description: error.debugMessage)
            self.delagate?.changeLoading(value: false)
        }
    }
}

