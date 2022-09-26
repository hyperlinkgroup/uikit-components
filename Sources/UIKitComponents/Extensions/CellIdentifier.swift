//
//  CellIdentifier.swift
//
//
//  Created by Anna Münster on 05.10.18.
//  Copyright © 2018 spacesquad. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    public static var identifier: String {
        String(describing: self)
    }
}

extension UITableViewCell {
    public static var identifier: String {
        String(describing: self)
    }
}
extension UITableViewHeaderFooterView {
    public static var identifier: String {
        String(describing: self)
    }
}
