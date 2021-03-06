//
//  File.swift
//  
//
//  Created by Paolo Moroni on 08/02/2020.
//

import UIKit

protocol Configurator {
    associatedtype Model
    associatedtype View

    func configure(_ : View, with: Model)
}
