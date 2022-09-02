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
    
    public init(image: UIImage,
                tintColor: UIColor? = nil,
                cornerRadius: CGFloat = 0,
                contentMode: UIView.ContentMode = .scaleAspectFit,
                isOriginal: Bool = false) {
        
        super.init(frame: .zero)
        
        self.image = image.withRenderingMode(isOriginal ? .alwaysOriginal : .alwaysTemplate)
        
        self.tintColor = tintColor
        
        self.layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
        self.clipsToBounds = true
        
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
