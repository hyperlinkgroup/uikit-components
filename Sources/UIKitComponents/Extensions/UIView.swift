//
//  UIView.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

public extension UIView {
    /**
     Define each constraint for a view respective to other views with optional padding.
     
     Paddings can be positive or negative.
     
     - Parameter centerX: Horizontal center
     - Parameter centerY: Vertical center
     - Parameter top: Top border
     - Parameter left: Left border
     - Parameter bottom: Bottom border
     - Parameter right: Right border
     - Parameter paddingCenterX: Padding from horizontal center
     - Parameter paddingCenterY: Padding from vertical center
     - Parameter paddingTop: Padding from the top
     - Parameter paddingLeft: Padding from the left
     - Parameter paddingBottom: Padding from the bottom
     - Parameter paddingRight: Padding from the right
     - Parameter width: Width of the view
     - Parameter height: Height of the view
     */
    func anchor(centerX: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil,
                top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingCenterX: CGFloat = 0,
                paddingCenterY: CGFloat = 0,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat = 0,
                height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            let centerX = centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX)
            centerX.isActive = true
        }
        
        if let centerY = centerY {
            let centerY = centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY)
            centerY.isActive = true
        }
        
        if let top = top {
            let top = topAnchor.constraint(equalTo: top, constant: paddingTop)
            top.priority = UILayoutPriority(rawValue: 750)
            top.isActive = true
        }
        
        if let left = left {
            let left = leftAnchor.constraint(equalTo: left, constant: paddingLeft)
            left.priority = UILayoutPriority(rawValue: 999)
            left.isActive = true
        }
        
        if let bottom = bottom {
            let bottom = bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom)
            bottom.priority = UILayoutPriority(rawValue: 750)
            bottom.isActive = true
        }
        
        if let right = right {
            let right = rightAnchor.constraint(equalTo: right, constant: paddingRight)
            right.priority = UILayoutPriority(rawValue: 999)
            right.isActive = true
        }
        
        if width != 0 {
            let width = widthAnchor.constraint(equalToConstant: width)
            width.isActive = true
        }
        
        if height != 0 {
            let height = heightAnchor.constraint(equalToConstant: height)
            height.isActive = true
        }
    }
    
    /**
     Set the size of a view to fill it's superview with optional padding on each side.
     
     - Parameter paddingTop: Padding from the top
     - Parameter paddingLeft: Padding from the left
     - Parameter paddingBottom: Padding from the bottom
     - Parameter paddingRight: Padding from the right
     */
    func fillSuperview(paddingTop: CGFloat = 0,
                       paddingLeft: CGFloat = 0,
                       paddingBottom: CGFloat = 0,
                       paddingRight: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewTopAnchor = superview?.topAnchor {
            let top = topAnchor.constraint(equalTo: superviewTopAnchor, constant: paddingTop)
            top.priority = UILayoutPriority(rawValue: 750)
            top.isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            let leading = leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: paddingLeft)
            leading.priority = UILayoutPriority(rawValue: 999)
            leading.isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            let bottom = bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: paddingBottom)
            bottom.priority = UILayoutPriority(rawValue: 750)
            bottom.isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            let trailing = trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: paddingRight)
            trailing.priority = UILayoutPriority(rawValue: 999)
            trailing.isActive = true
        }
    }
    
    /**
     Set the width of a view.
     
     - Parameter constant: Size for the width
     */
    func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    /**
     Set the height of a view.
     
     - Parameter constant: Size for the height
     */
    func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    /**
     Set the size of a view with equal sides.
     
     - Parameter constant: Size for each side
     */
    func constrainSquare(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: constant),
            heightAnchor.constraint(equalToConstant: constant)
        ])
    }
}
