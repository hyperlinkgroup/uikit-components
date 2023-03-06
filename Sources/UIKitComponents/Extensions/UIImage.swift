//
//  UIImage.swift
//
//  Created by Kevin Waltz on 22.06.20.
//

import UIKit

public extension UIImage {
    /**
     Returns the original image without scaling in horizontal orientation
     
     - Returns: Bild
     */
    func setImageOrientation() -> UIImage {
        self.setImageOrientation(size: size, rect: CGRect(origin: .zero, size: size))
    }
    
    /**
     
     Adapts the Orientation of an Image.
     
     In some cases Images will be rotated ignoring the correct orientation. This function fixes these problems and returns the image with horizontal orientation by default
          
     - Parameter size: Size of the Image (original or scaled)
     - Parameter rect: Frame of the Image
     
     - Returns: Image
     */
    private func setImageOrientation(size: CGSize, rect: CGRect) -> UIImage {
        switch imageOrientation {
        case .up:
            return self
        default:
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            draw(in: rect)
            
            if let result = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext()
                
                return result
            } else {
                return self
            }
        }
    }
    
    /**
     Crops an Image to square
     
     - Parameter size: Length of the side
     
     - Returns: Square Image
     */
    func cropToSquare(_ size: CGFloat) -> UIImage {
        guard let cgimage = self.cgImage else { return self }
        let contextImage = UIImage(cgImage: cgimage)
        
        guard let newCgImage = contextImage.cgImage else { return self }
        
        let contextSize: CGSize = contextImage.size
        
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        let cropAspect: CGFloat = size / size
        
        var cropWidth: CGFloat = size
        var cropHeight: CGFloat = size
        
        if contextSize.width >= contextSize.height {
            cropHeight = contextSize.height
            cropWidth = contextSize.height * cropAspect
            
            posX = (contextSize.width - cropWidth) / 2
        } else {
            cropWidth = contextSize.width
            cropHeight = contextSize.width / cropAspect
            
            posY = (contextSize.height - cropHeight) / 2
        }
        
        let rect = CGRect(x: posX, y: posY, width: cropWidth, height: cropHeight)
        guard let imageRef: CGImage = newCgImage.cropping(to: rect) else { return self }
        let cropped = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        UIGraphicsBeginImageContextWithOptions(.init(width: size, height: size), false, self.scale)
        cropped.draw(in: .init(x: 0, y: 0, width: size, height: size))
        
        let resized = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resized ?? self
    }
    
    /**
     Scales an Image to a given file size

     Loop is continued until the result is lower than the given file size: compress rate with 0.9 -> longest side to 3840px, compress rate with 0.6 -> error
     
     - Parameter size: Size in MB
     
     - Returns: Image Data
     */
    func scaleImageBelowSizeInMB(_ size: Double) -> Data? {
        guard let originalImage = self.jpegData(compressionQuality: 0.95) else { return nil }
        
        if self.isLargerThanMBSize(originalImage, size: size) {
            guard let downsizedImage = self.resizeImageWithLongestSide(3840).jpegData(compressionQuality: 0.95) else { return nil }
            
            if self.isLargerThanMBSize(downsizedImage, size: size) {
                guard let maxDownsizedImage = UIImage(data: downsizedImage)?.jpegData(compressionQuality: 0.6) else { return nil }
                
                if self.isLargerThanMBSize(maxDownsizedImage, size: size) {
                    return nil
                }
                
                return maxDownsizedImage
            }
            
            return downsizedImage
        }
        
        return originalImage
    }
    
    /**
     Checks the file size.
     
     - Parameter image: Image Data
     - Parameter size: Size in MB
     
     - Returns: True if size is greater than the target size
     */
    func isLargerThanMBSize(_ image: Data, size: Double) -> Bool {
        Double(image.count / 1024 / 1024) > size
    }
    
    /**
     Scales an image with the longest side
     
     - Parameter longestSide: maximum length of the longest side
     
     - Returns: Image
     */
    func resizeImageWithLongestSide(_ longestSide: CGFloat) -> UIImage {
        let originalWidth = size.width
        let originalHeight = size.height
        
        if originalWidth > originalHeight {
            return createResizedImage(width: longestSide, height: originalHeight * (longestSide / originalWidth))
        }
        
        return createResizedImage(width: originalWidth * (longestSide / originalHeight), height: longestSide)
    }
    
    private func createResizedImage(width: CGFloat, height: CGFloat) -> UIImage {
        var resizedImage: UIImage?
        
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage ?? self
    }
    
    /**
     Calculates the size of an Image in Fullscreen Mode
     
     - Parameter view: View that will display the image
     - Parameter initialImage: Image to be scaled
     
     - Returns: Frame
     */
    func getFullscreenImageSize(in view: UIView) -> CGRect {
        let isLandScape = UIScreen.main.bounds.height < UIScreen.main.bounds.width
        
        if isLandScape {
            let width = (view.frame.height / size.height) * size.width
            let xValue = view.frame.width / 2 - width / 2
            
            return .init(x: xValue, y: 0, width: width, height: view.frame.height)
        } else {
            let height = (view.frame.width / size.width) * size.height
            let yValue = view.frame.height / 2 - height / 2
            
            return .init(x: 0, y: yValue, width: view.frame.width, height: height)
        }
    }
    
    
}
