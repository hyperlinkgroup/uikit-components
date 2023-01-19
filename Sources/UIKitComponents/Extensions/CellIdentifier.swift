//
//  CellIdentifier.swift
//
//
//  Created by Anna Münster on 05.10.18.
//  Copyright © 2018 spacesquad. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

public extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}
public extension UITableViewHeaderFooterView {
    static var identifier: String {
        String(describing: self)
    }
}
