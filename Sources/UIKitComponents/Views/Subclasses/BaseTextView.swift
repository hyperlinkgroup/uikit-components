//
//  BaseTextView.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit
import Combine

/**
 Subclass for a UITextView.
 
 We added an option to set a placeholder, which isn't built-in by Apple.
 You can also subscribe to 'currentText' to read the user's input and to 'isEditing' to check whether the TextViews is being edited.
 If you override the TextView's delegate in your view, the placeholder and the subscriber will no longer work and you need to add it yourself.
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
                isScrollable: Bool = true,
                isEditable: Bool = true) {
        
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
    
    public let currentText = CurrentValueSubject<String, Never>("")
    public let isInEditMode = CurrentValueSubject<Bool, Never>(false)
    
    private let customTextColor: UIColor
    private let placeholder: String
    
    
    
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
        isInEditMode.send(true)
        
        if textView.text == placeholder {
            self.removePlaceholder()
        }
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        currentText.send(textView.text)
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        isInEditMode.send(false)
        
        guard !textView.text.isEmpty else { return }
        setPlaceholder()
    }
    
}
