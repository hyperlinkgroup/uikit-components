//
//  BaseTextView.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit
import Combine

/**
 Subclass for a BaseTextView.
 */
public class BaseTextView: UITextView, UITextViewDelegate {
    
    public init(placeholder: String = "",
                text: String? = nil,
                textColor: UIColor = .label,
                textAlignment: NSTextAlignment = .left,
                font: UIFont,
                backgroundColor: UIColor = .clear,
                cornerRadius: CGFloat = 0,
                padding: CGFloat = 0,
                isScrollable: Bool = false,
                isEditable: Bool = false) {
        
        self.customTextColor = textColor
        self.placeholder = placeholder
        
        super.init(frame: .zero, textContainer: .none)
        
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        
        self.font = font
        
        self.isScrollEnabled = isScrollable
        self.isEditable = isEditable
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
        self.delegate = self
        
        self.textContainerInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        
        setPlaceholder()
    }
    
    required public init?(coder: NSCoder) {
        self.customTextColor = .label
        self.placeholder = ""
        
        super.init(coder: coder)
    }
    
    
    
    // MARK: - Variables
    
    let textIsValid = CurrentValueSubject<Bool, Never>(false)
    
    let customTextColor: UIColor
    let placeholder: String
    
    
    
    // MARK: - Placeholder
    
    private func setPlaceholder() {
        if placeholder.isEmpty { return }
        
        self.text = placeholder
        self.textColor = .lightGray
    }
    
    private func removePlaceholder() {
        self.text = nil
        self.textColor = customTextColor
    }
    
    
    
    // MARK: - Delegate
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder {
            self.removePlaceholder()
        }
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        textIsValid.send(!textView.text.isEmpty)
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if !textView.text.isEmpty { return }
        setPlaceholder()
    }
    
}
