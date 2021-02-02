//
//  TodoDetailViewController.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/14/21.
//

import UIKit

final class TodoDetailViewController: UIViewController {
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!

    var delegate: TodoDetailProtocol?
    lazy var todo: Todo? = Todo(subTitle: "", title: "")
    lazy var selectedIndex: Int? = 0

    var todoItem: Todo {
        return Todo(subTitle: taskNameTextField.text ?? "", title: taskDescriptionTextField.text ?? "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.setTodoOnTextField()
        }
    }

    private func setTodoOnTextField() {
        taskNameTextField.text = todo?.title
        taskDescriptionTextField.text = todo?.subTitle
    }
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onUpdateButtonPressed(_ sender: Any) {
        dismiss(animated: false) { [weak self] in
            guard let self = self, let index = self.selectedIndex else { return }
            self.delegate?.onUpdate(item: self.todoItem, index: index)
        }
    }
}
