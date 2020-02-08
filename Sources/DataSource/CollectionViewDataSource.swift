//
//  File.swift
//  
//
//  Created by Paolo Moroni on 08/02/2020.
//

import UIKit

class CollectionViewDataSource<C: CollectionCellConfigurator>:
NSObject, UICollectionViewDataSource {

    private let model: [C.Model]
    private let configurator: C

    init(model: [C.Model], configurator: C) {
        self.model = model
        self.configurator = configurator
        super.init()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return model.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: C.Cell.reuseIdentifier,
            for: indexPath
        ) as? C.Cell else {
            assertionFailure("Ooops!")
            return UICollectionViewCell()
        }

        let cellModel = model[indexPath.row]
        configurator.configure(cell, with: cellModel)

        return cell
    }
}
