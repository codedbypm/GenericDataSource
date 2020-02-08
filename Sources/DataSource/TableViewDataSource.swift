//
//  File.swift
//  
//
//  Created by Paolo Moroni on 08/02/2020.
//

import UIKit

class TableViewDataSource<C: TableCellConfigurator>: NSObject, UITableViewDataSource {

    private let model: [C.Model]
    private let configurator: C

    init(model: [C.Model], configurator: C) {
        self.model = model
        self.configurator = configurator
        super.init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: C.Cell.reuseIdentifier,
            for: indexPath
        ) as? C.Cell else {
            assertionFailure("Ooops!")
            return UITableViewCell()
        }

        let cellModel = model[indexPath.row]
        configurator.configure(cell, with: cellModel)

        return cell
    }
}
