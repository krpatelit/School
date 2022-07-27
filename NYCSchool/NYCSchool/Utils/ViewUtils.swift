//
//  ViewUtils.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation
import UIKit

extension UIView {
    static var nib: UINib? {
        UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
