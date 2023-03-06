//
//  BaseImageView.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

/**
 Subclass for a UIImageView.
 */
public class BaseImageView: UIImageView {
    
    public init(image: UIImage? = nil,
                tintColor: UIColor? = nil,
                cornerRadius: CGFloat = 0,
                contentMode: UIView.ContentMode = .scaleAspectFill,
                isOriginal: Bool = false) {
        
        super.init(frame: .zero)
        
        if isOriginal {
            self.image = image?.withRenderingMode(.alwaysOriginal)
        } else {
            self.image = image?.withRenderingMode(.alwaysTemplate)
        }
        
        self.image = image?.withRenderingMode(isOriginal ? .alwaysOriginal : .alwaysTemplate)
        
        self.tintColor = tintColor
        
        self.layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
        self.clipsToBounds = true
        
        self.isUserInteractionEnabled = true
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
