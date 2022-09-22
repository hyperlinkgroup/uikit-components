//
//  UITextField.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

public extension UITextField {
    /**
     Declare a vertical padding for text within a UITextField.
     
     - Parameter left: Left padding
     - Parameter right: Right padding
     */
    func setTextPadding(left: CGFloat, right: CGFloat) {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: frame.size.height))
        leftView = leftPaddingView
        leftViewMode = .always
        
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: frame.size.height))
        rightView = rightPaddingView
        rightViewMode = .always
    }
}
