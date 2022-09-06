//
//  ExampleItem.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import Foundation
import UIKit

enum ExampleItem: Int, CaseIterable {
    case buttonImage, buttonText, imageView, label, stackView, textField, textView, view
    
    
    var title: String {
        switch self {
        case .buttonImage: return "BaseButtonWithImage"
        case .buttonText: return "BaseButtonWithText"
        case .imageView: return "BaseImageView"
        case .label: return "BaseLabel"
        case .stackView: return "BaseStackView"
        case .textField: return "BaseTextField"
        case .textView: return "BaseTextView"
        case .view: return "BaseView"
        }
    }
    
    var correspondingView: UIViewController {
        switch self {
        case .buttonImage: return ButtonImageVC()
        case .buttonText: return ButtonTextVC()
        case .imageView: return ImageViewVC()
        case .label: return LabelVC()
        case .stackView: return StackViewVC()
        case .textField: return TextFieldVC()
        case .textView: return TextViewVC()
        case .view: return ViewVC()
        }
    }
}
