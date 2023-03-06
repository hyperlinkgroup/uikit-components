//
//  UICollectionView.swift
//  
//
//  Created by Anna Münster on 19.01.23.
//

import UIKit

public extension UICollectionView {
    /**
     Checks if given IndexPath exists in the current controller.
     */
    func isValid(indexPath: IndexPath) -> Bool {
      indexPath.section < numberOfSections && indexPath.row < numberOfItems(inSection: indexPath.section)
    }
}

