//
//  UIScreen.swift
//
//  Created by Kevin Waltz on 28.09.20.
//

import UIKit

public extension UIScreen {
    
    /**
     Checks the density of pixels of a display.
     
     Returns Values for Retina (2) or RetinaHD (3)
     */
    var screenScale: CGFloat? {
        guard UIScreen.main.responds(to: #selector(getter: scale)) else {
            return nil
        }
        
        return UIScreen.main.scale
    }
    
    /**
     Returns the Screen Scale.

     The minimum value is 2 (Retina)
     */
    static func getCurrentScreenScale() -> CGFloat {
        UIScreen.main.scale > 2 ? UIScreen.main.scale : 2
    }
    
}
