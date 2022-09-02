//
//  ButtonWithText.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

public class ButtonWithText: UIButton {
    
    override public var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15) {
                self.titleLabel?.alpha = self.isHighlighted ? 0.2 : 1
            }
        }
    }
    
    /**
     Setup a button displaying text.
     
     - Parameter title: The text to be shown
     - Parameter titleColor: The text's tint color (default: .label)
     - Parameter titleAlignment: The title's horizontal alignment (default: .center)
     - Parameter font: The title's font
     - Parameter numberOfLines: The lines do be displayed (default: 1)
     */
    public init(title: String,
                titleColor: UIColor? = .label,
                titleAlignment: NSTextAlignment = .center,
                font: UIFont,
                numberOfLines: Int = 1) {
        
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
        self.titleLabel?.font = font
        self.titleLabel?.numberOfLines = numberOfLines
        self.titleLabel?.textAlignment = titleAlignment
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
