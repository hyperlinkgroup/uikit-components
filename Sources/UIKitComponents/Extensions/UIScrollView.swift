//
//  UIScrollView.swift
//
//  Created by Kevin Waltz on 24.06.20.
//

import UIKit

public extension UIScrollView {
    /**
     Zum Ende eines ScrollViews scrollen.
     
     - Parameter animated: scrollen animieren
     */
    func scrollToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom + safeAreaInsets.bottom)
        setContentOffset(bottomOffset, animated: animated)
    }
}
