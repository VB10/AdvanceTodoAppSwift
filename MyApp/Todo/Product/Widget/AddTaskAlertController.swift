//
//  AddTaskAlertController.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//

import UIKit

final class AddTaskAlertController: UIAlertController {

    private let titleTask: String = "Tasks"
    private let titleTaskPlaceHolder: String = "Enter Task Name"
    private let titleTaskDescriptionPlaceHolder: String = "Enter The Task Description"

    private let saveeButtonTitle: String = "Save"
    private let cancelButtonTitle: String = "Cancel"

    weak var textFieldTask: UITextField?
    weak var textFieldDescription: UITextField?
    var delagate: AddTaskProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.titleTask
        self.addActions()
        self.addCancelAction()
        self.addTaskFields()

    }
    
    private func addTaskFields() {
        addTextField { [weak self] textField in
            guard let self = self else { return }
            textField.placeholder = self.titleTaskPlaceHolder
        }
        addTextField { [weak self] textField in
            guard let self = self else { return }
            textField.placeholder = self.titleTaskDescriptionPlaceHolder
        }
    }

    private func addActions() {
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { [weak self] fields in
            guard let self = self else { return }
            self.textFieldTask = self.textFields?[0]
            self.textFieldDescription = self.textFields?[1]
            self.sendTodoItems()

        })
        addAction(saveAction)
    }

    private func addCancelAction() {
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: { (action: UIAlertAction!) -> Void in
            self.dismiss(animated: true, completion: nil)
        })
        addAction(cancelAction)
    }

    private func sendTodoItems() {
        guard let delagate = self.delagate else { return }
        delagate.onAddItem(item: Todo(subTitle: textFieldTask?.text ?? "", title: textFieldDescription?.text ?? ""))
    }

}

extension UIAlertController {
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("height == 0") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
