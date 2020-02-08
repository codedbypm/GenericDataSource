//
//  File.swift
//  
//
//  Created by Paolo Moroni on 08/02/2020.
//

import UIKit

class TableViewDataSource<C: TableViewCellConfigurator>:
NSObject, UITableViewDataSource {

    var headerText: String?
    var footerText: String?

    var canEditRows: Bool = true
    var canMoveRows: Bool = true

    var onCommitEditing: ((UITableViewCell.EditingStyle, IndexPath) -> Void)?
    var onMoveRow: ((IndexPath, IndexPath) -> Void)?

    private let model: [C.Model]
    private let configurator: C

    init(model: [C.Model], configurator: C) {
        self.model = model
        self.configurator = configurator
        super.init()
    }

    // MARK: - Standard

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return model.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: C.View.reuseIdentifier,
            for: indexPath
        ) as? C.View else {
            assertionFailure("Ooops!")
            return UITableViewCell()
        }

        let cellModel = model[indexPath.row]
        configurator.configure(cell, with: cellModel)

        return cell
    }
}

// MARK: - Header and Footer

extension TableViewDataSource {

    func tableView(_ : UITableView, titleForHeaderInSection: Int) -> String? {
        return headerText
    }

    func tableView(_ : UITableView, titleForFooterInSection: Int) -> String? {
        return footerText
    }
}

// MARK: - Table editing

extension TableViewDataSource {

    func tableView(_: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canEditRows
    }

    func tableView(_: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return canMoveRows
    }

    func tableView(
        _: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        onCommitEditing?(editingStyle, indexPath)
    }

    func tableView(_: UITableView, moveRowAt from: IndexPath, to: IndexPath) {
        onMoveRow?(from, to)
    }
}

// MARK: - Table index title

extension TableViewDataSource {

    func sectionIndexTitles(for: UITableView) -> [String]? {
        return nil
    }

    func tableView(_: UITableView,
        sectionForSectionIndexTitle title: String,
        at index: Int
    ) -> Int {
        return NSNotFound
    }
}
