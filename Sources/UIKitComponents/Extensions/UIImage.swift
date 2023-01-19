//
//  UIImage.swift
//
//  Created by Kevin Waltz on 22.06.20.
//

import UIKit

public extension UIImage {
    /**
     Das Originalbild ohne Skalierung wird in aufrechter Orientierung ausgegeben.
     
     - Returns: Bild
     */
    func setImageOrientation() -> UIImage {
        self.setImageOrientation(size: size, rect: CGRect(origin: .zero, size: size))
    }
    
    /**
     Anpassung der Orientierung eines Bildes.
     
     In manchen Fällen werden Bilder trotz korrekter Anzeige bei der Auswahl gedreht, sodass diese nicht mehr horizontal sind. Hiermit wird das Bild standardmäßig in eine horizontale Ausrichtung gebracht.
     
     - Parameter size: Größe des Fotos (original oder skaliert)
     - Parameter rect: Rahmen für Foto
     
     - Returns: Bild
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
     Zuschneiden eines Bildes in quadratische Form.
     
     - Parameter size: Seitenlänge
     
     - Returns: Bild
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
     Skalierung eines Bilder unter eine bestimmte Dateigröße.
     
     Schleife wird jeweils fortgeführt, wenn das Ergebnis nicht unter der angebenen Dateigröße liegt: Komprimierung mit 0.9 -> längste Seite auf 3840px -> Komprimierung mit 0.6 -> Fehler
     
     - Parameter size: Dateigröße in MB
     
     - Returns: Foto als Data-Wert
     */
    public func scaleImageBelowSizeInMB(_ size: Double) -> Data? {
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
     Überprüfung der Dateigröße.
     
     - Parameter image: Foto als Data-Wert zum Überprüfen
     - Parameter size: Größe in MB
     
     - Returns: Wahr wenn größer als n MB, False wenn kleiner als n MB
     */
    func isLargerThanMBSize(_ image: Data, size: Double) -> Bool {
        Double(image.count / 1024 / 1024) > size
    }
    
    /**
     Skalierung eines Fotos mit der längsten Seite.
     
     - Parameter longestSide: die maximale Länge der längsten Seite
     
     - Returns: Foto
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
     Berechnen der Größe eines Fotos im Vollbildmodus.
     
     - Parameter view: View, in dem das Foto angezeigt wird
     - Parameter initialImage: Foto, auf deren Basis die Größe berechnet wird
     
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
