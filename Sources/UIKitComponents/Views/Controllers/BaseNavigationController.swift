//
//  BaseNavigationController.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

/**
 Subclass for UINavigationController to override the default status bar style.
 */
public class BaseNavigationController: UINavigationController {
    
    // Overrides the status bar, so it can be set to light
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topVC = viewControllers.last {
            return topVC.preferredStatusBarStyle
        }
        
        return .default
    }
    
}
