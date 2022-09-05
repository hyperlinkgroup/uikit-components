//
//  BaseTextField.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

/**
 Subclass for a UITextField.
 */
public class BaseTextField: UITextField {
    
    public init(placeholder: String? = nil,
                text: String? = nil,
                textColor: UIColor = .label,
                textAlignment: NSTextAlignment = .left,
                font: UIFont,
                textPaddingLeft: CGFloat = 0,
                textPaddingRight: CGFloat = 0,
                returnKeyType: UIReturnKeyType,
                tintColor: UIColor = .label,
                backgroundColor: UIColor? = nil,
                cornerRadius: CGFloat = 0) {
        
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.text = text
        
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
        self.returnKeyType = returnKeyType
        
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
        self.setTextPadding(left: textPaddingLeft, right: textPaddingRight)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
