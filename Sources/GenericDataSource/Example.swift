//
//  File.swift
//  
//
//  Created by Paolo Moroni on 08/02/2020.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {

    private let sectionDataSources: [UITableViewDataSource]

    init(sectionDataSources: [UITableViewDataSource]) {
        self.sectionDataSources = sectionDataSources
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource(at: section).tableView(tableView, numberOfRowsInSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource(at: indexPath.section).tableView(tableView, cellForRowAt: indexPath)
    }

    func dataSource(at index: Int) -> UITableViewDataSource {
        return sectionDataSources[index]
    }
}
