//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 20/06/22.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
