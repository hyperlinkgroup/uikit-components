//
//  UICollectionView.swift
//  
//
//  Created by Anna Münster on 19.01.23.
//

import UIKit

/**
 Überprüfung, ob der gegebene IndexPath im CollectionView existiert.
 
 - Parameter indexPath: IndexPath, der überprüft wird
 
 - Returns: Bool für Bestehen
 */
public extension UICollectionView {
    func isValid(indexPath: IndexPath) -> Bool {
      indexPath.section < numberOfSections && indexPath.row < numberOfItems(inSection: indexPath.section)
    }
}

