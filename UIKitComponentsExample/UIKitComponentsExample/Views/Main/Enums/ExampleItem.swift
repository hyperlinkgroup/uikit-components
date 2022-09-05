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
        case .buttonImage: return "Button (Image)"
        case .buttonText: return "Button (Text)"
        case .imageView: return "ImageView"
        case .label: return "Label"
        case .stackView: return "StackView"
        case .textField: return "TextField"
        case .textView: return "TextView"
        case .view: return "View"
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
