//
//  File.swift
//  
//
//  Created by Paolo Moroni on 08/02/2020.
//

import UIKit

protocol Configurator {
    associatedtype Model
    associatedtype Cell

    func configure(_ : Cell, with: Model)
}

protocol CellConfigurator: Configurator where Cell: UITableViewCell {
    
}
