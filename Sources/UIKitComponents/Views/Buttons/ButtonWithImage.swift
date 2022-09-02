//
//  ButtonWithImage.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

public class ButtonWithImage: UIButton {
    
    public override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15) {
                self.imageView?.alpha = self.isHighlighted ? 0.2 : 1
            }
        }
    }
    
    /**
     Setup a button displaying an image.
     
     - Parameter image: The image to be shown
     - Parameter tintColor: The image's tint color
     - Parameter backgroundColor: The button's background color
     - Parameter cornerRadius: The button's corner radius
     */
    public init(image: UIImage,
                tintColor: UIColor,
                backgroundColor: UIColor? = nil,
                cornerRadius: CGFloat = 0) {
        
        super.init(frame: .zero)
        
        self.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        
        self.tintColor = tintColor
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
