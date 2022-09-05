//
//  BaseLabel.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

/**
 Subclass for a UILabel.
 */
open class BaseLabel: UILabel {
    
    public init(text: String? = nil,
                textColor: UIColor? = .label,
                textAlignment: NSTextAlignment = .left,
                font: UIFont,
                numberOfLines: Int = 1,
                textToFitWidth: Bool = false) {
        
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
        self.numberOfLines = numberOfLines
        
        self.adjustsFontSizeToFitWidth = textToFitWidth
        
        self.isUserInteractionEnabled = true
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    public var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top, left: -textInsets.left, bottom: -textInsets.bottom, right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
