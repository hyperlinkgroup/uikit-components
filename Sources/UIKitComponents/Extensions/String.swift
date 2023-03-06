//
//  String.swift
//  
//
//  Created by Anna Münster on 19.01.23.
//

import UIKit

public extension String {
    /**
     Calculates the height and width based on the number of characters, font and view
     
     - Parameter width: Width of the view containing the text
     - Parameter font: Font of the text
     
     - Returns: CGRect  containing width and height
     */
    func estimateSize(width: CGFloat, font: UIFont) -> CGRect {
        let size = CGSize(width: width, height: 10000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: self).boundingRect(with: size, options: options, attributes: [.font: font], context: nil)
    }
}

