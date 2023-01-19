//
//  String.swift
//  
//
//  Created by Anna Münster on 19.01.23.
//

import UIKit

public extension String {
    /**
     Berechnen der Höhe oder Breite basierend auf einem String.
     
     - Parameter width: Die Breite des Views, in dem der Text sitzt
     - Parameter font: Schriftgröße und -formatierung des Textes
     
     - Returns: CGRect zum Nutzen der Breite (.width) oder Höhe (.height)
     */
    func estimateSize(width: CGFloat, font: UIFont) -> CGRect {
        let size = CGSize(width: width, height: 10000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: self).boundingRect(with: size, options: options, attributes: [.font: font], context: nil)
    }
}
