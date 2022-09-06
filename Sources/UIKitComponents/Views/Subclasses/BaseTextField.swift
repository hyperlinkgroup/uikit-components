//
//  BaseTextField.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit
import Combine

/**
 Subclass for a UITextField.
 
 You can also subscribe to 'currentText' to read the user's input and to 'isEditing' to check whether the TextViews is being edited.
 If you override the TextField's delegate in your view, the subscriber will no longer work and you need to add it yourself.
 */
public class BaseTextField: UITextField, UITextFieldDelegate {
    
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
        
        self.delegate = self
        
        self.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    // MARK: - Variables
    
    public let currentText = CurrentValueSubject<String, Never>("")
    public let isInEditMode = CurrentValueSubject<Bool, Never>(false)
    
    
    
    // MARK: - Delegate
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        isInEditMode.send(true)
    }
    
    @objc
    private func textDidChange(_ textField: UITextField) {
        currentText.send(textField.text ?? "")
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        isInEditMode.send(false)
    }
    
}
