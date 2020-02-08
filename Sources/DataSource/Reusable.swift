//
//  File.swift
//  
//
//  Created by Paolo Moroni on 08/02/2020.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
