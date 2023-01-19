//
//  UIScreen.swift
//
//  Created by Kevin Waltz on 28.09.20.
//

import UIKit

public extension UIScreen {
    
    /**
     Überprüfen der Pixeldichte des Displays.
     
     Gibt Werte für Retina (2) oder RetinaHD (3) aus.
     */
    var screenScale: CGFloat? {
        guard UIScreen.main.responds(to: #selector(getter: scale)) else {
            return nil
        }
        
        return UIScreen.main.scale
    }
    
    /**
     Pixeldichte des Displays zur Berechnung bestimmen.
     
     Wenn die Pixeldichte größer als 2 ist (RetinaHD) wird immer mit diesem Wert gerechnet, ansonsten mit 2 als Retina.
     */
    static func getCurrentScreenScale() -> CGFloat {
        UIScreen.main.scale > 2 ? UIScreen.main.scale : 2
    }
    
}
