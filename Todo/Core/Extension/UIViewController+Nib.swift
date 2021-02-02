//
//  UIViewController+Nib.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/14/21.
//

import UIKit


extension UIViewController {

    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}
