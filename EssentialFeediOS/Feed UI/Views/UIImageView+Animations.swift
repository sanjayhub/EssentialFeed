//
//  UIImageView+Animations.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 14/06/23.
//
import UIKit

extension UIImageView {
    func setImageAnimated(_ newImage: UIImage?) {
        image = newImage
        guard newImage != nil else {return }
        alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}
