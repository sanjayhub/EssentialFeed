//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 14/06/23.
//

import UIKit
extension UITableView {
    func dequeReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
