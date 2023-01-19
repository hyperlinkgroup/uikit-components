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
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            centerX?.constraint(equalTo: centerXAnchor, constant: -paddingCenterX),
            centerY?.constraint(equalTo: centerYAnchor, constant: -paddingCenterY),
            top?.constraint(equalTo: topAnchor, constant: -paddingTop, priority: 750),
            left?.constraint(equalTo: leftAnchor, constant: -paddingLeft, priority: 999),
            bottom?.constraint(equalTo: bottomAnchor, constant: -paddingBottom, priority: 750),
            right?.constraint(equalTo: rightAnchor, constant: -paddingRight, priority: 999),
            widthAnchor.constraint(equalToOptionalConstant: width),
            heightAnchor.constraint(equalToOptionalConstant: height)
        ].compactMap { $0 })
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
        
        NSLayoutConstraint.activate([
            superview?.topAnchor.constraint(equalTo: topAnchor, constant: -paddingTop, priority: 750),
            superview?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -paddingLeft, priority: 999),
            superview?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingBottom, priority: 750),
            superview?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -paddingLeft, priority: 999)
        ].compactMap { $0 })
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
    
    /**
     Hinzufügen eines Farbverlaufs.
     
     - Parameter color1: Farbe für Startpunkt
     - Parameter color2: Farbe für Endpunkt
     - Parameter startPoint: Startpunkt
     - Parameter endPoint: Endpunkt
     */
    func addGradient(color1: UIColor, color2: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        let gradient = CAGradientLayer()
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = layer.frame
        
        layer.insertSublayer(gradient, at: 0)
    }
    
    
    /**
     Berechnen der Größe der StatusBar, NavigationBar und des unteren Paddings.
     
     - Parameter view: View des ViewControllers
     - Parameter navigationController: NavigationController des ViewControllers
     
     - Returns: Größe als CGFloat & Bool, ob einen BottomInset gibt (d.h. es ist ein iPhone ohne Home Button)
     */
    func getHeights(in navigationController: UINavigationController? = nil) -> (size: CGFloat, hasBottomInset: Bool) {
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let bottomInset = safeAreaInsets.bottom
        
        return (statusBarHeight + navigationBarHeight + bottomInset, bottomInset > 0)
    }
    
    /**
     Wiedergabe von haptischem Feedback.
     
     - Parameter style: Stärke des haptischen Feedbacks
     */
    func generateHapticFeedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: style)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
}
