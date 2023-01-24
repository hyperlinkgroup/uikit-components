//
//  Priorities.swift
//  
//
//  Created by Anna Münster on 26.09.22.
//

import UIKit

extension NSLayoutAnchor {
    @objc
    open func constraint(equalTo anchor: NSLayoutAnchor<AnchorType>, priority: Float) -> NSLayoutConstraint {
        let con = constraint(equalTo: anchor)
        con.priority = UILayoutPriority(rawValue: priority)
        return con
    }

    @objc
    open func constraint(equalTo anchor: NSLayoutAnchor<AnchorType>, constant: CGFloat, priority: Float) -> NSLayoutConstraint {
        let con = constraint(equalTo: anchor, constant: constant)
        con.priority = UILayoutPriority(rawValue: priority)
        return con
    }
}

extension NSLayoutDimension {
    @objc
    open func constraint(equalToConstant constant: CGFloat, priority: Float) -> NSLayoutConstraint {
        let con = constraint(equalToConstant: constant)
        con.priority = UILayoutPriority(rawValue: priority)
        return con
    }
    
    open func constraint(equalToOptionalConstant constant: CGFloat?) -> NSLayoutConstraint? {
        guard let constant else { return nil }
        return constraint(equalToConstant: constant)
    }
}
