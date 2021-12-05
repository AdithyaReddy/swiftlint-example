//
//  Sample.swift
//  swiftlint-example
//
//  Created by Adithya Reddy on 05/12/21.
//

import Foundation

 class SampleClass {


     @objc public class ZGradient: NSObject {

         //A public enum which specifies the gradient direction
         @objc public enum GradientDirection: Int, CaseIterable {
             case horizontalLeftToRight
             case horizontalRightToLeft
             case verticalTopToBottom
             case verticalBottomToTop
             case diagonalLeftToRight
             case diagonalLeftBottomToRightTop
             case diagonalRightBottomToLeftTop
             case diagonalRightToLeft
         }

         //Use this static method to obtain a gradient layer with the provided options
         /// Param - gradientDirection - An enum object specifying gradient direction
         /// Param - colors - An array of CGColors for gradient - default is black and clear
         /// Param - cornerRadius - cornerRadius for gradient layer - default 0
         /// Param - locations - array of NSNumber locations for gradient - default-[0,0.5]
         public static func getGradient(withDirection gradientDirection: GradientDirection,
                                        colors: Array<CGColor> = [UIColor.black.cgColor, UIColor.clear.cgColor],
                                 cornerRadius: CGFloat = 0,
                                 locations: Array<NSNumber> = [0.0, 0.5].map({NSNumber.init(value: $0)})) -> CAGradientLayer
         {

             let layer = CAGradientLayer()
             layer.startPoint = getStartPointForDirection(gradientDirection)
             layer.endPoint = getEndPointForDirection(gradientDirection)
             layer.cornerRadius = cornerRadius
             layer.colors = colors
             layer.locations = locations
             return layer
         }

         //Use this method in objective-c files (as objc does not support second param; array with primitive types, i.e. cgColor.)
         @available(swift, obsoleted: 1.0, deprecated: 1.0, message: "Use other function with CGColor array as params")
         @objc public static func getGradientLayer(withDirection gradientDirection: GradientDirection,
                                              colors: Array<UIColor> = [UIColor.black, UIColor.clear],
                                              cornerRadius: CGFloat = 0,
                                              locations: Array<NSNumber>) -> CAGradientLayer {

             return getGradient(withDirection: gradientDirection, colors: colors.map{$0.cgColor}, cornerRadius: cornerRadius, locations: locations)
         }

         //A helper which returns the start point for gradient layer
         //based on GradientDirection enum
         /// Param - gradientDirection - enum object specifying the gradient direction
         public static func getStartPointForDirection(_ gradientDirection: GradientDirection) -> CGPoint {

             switch gradientDirection {
             case .horizontalLeftToRight:
                 return CGPoint(x: 0, y: 0.5)

             case .horizontalRightToLeft:
                 return CGPoint(x: 1, y: 0.5)

             case .verticalTopToBottom:
                 return CGPoint(x: 0.5, y: 0)

             case .verticalBottomToTop:
                 return CGPoint(x: 0.5, y: 1)

             case .diagonalLeftToRight:
                 return CGPoint(x: 0, y: 0)

             case .diagonalLeftBottomToRightTop:
                 return CGPoint(x: 0, y: 1)

             case .diagonalRightBottomToLeftTop:
                 return CGPoint(x: 1, y: 1)

             case .diagonalRightToLeft:
                 return CGPoint(x: 1, y: 1)
             }

         }

         //A helper which returns the end point for gradient layer
         //based on GradientDirection enum
         /// Param - gradientDirection - enum object specifying the gradient direction
         public static func getEndPointForDirection(_ gradientDirection: GradientDirection) -> CGPoint {

             switch gradientDirection {

             case .horizontalLeftToRight:
                 return CGPoint(x: 1, y: 0.5)

             case .horizontalRightToLeft:
                 return CGPoint(x: 0, y: 0.5)

             case .verticalTopToBottom:
                 return CGPoint(x: 0.5, y: 1)

             case .verticalBottomToTop:
                 return CGPoint(x: 0.5, y: 0)

             case .diagonalLeftToRight:
                 return CGPoint(x: 1, y: 1)

             case .diagonalLeftBottomToRightTop:
                 return CGPoint(x: 0.75, y: 0)

             case .diagonalRightBottomToLeftTop:
                 return CGPoint(x: 0, y: 0)

             case .diagonalRightToLeft:
                 return CGPoint(x: 0, y: 0)
             }
         }

         static public func getAllEnumCases() -> [ZGradient.GradientDirection] {
             return GradientDirection.allCases.map({$0})
         }

         static public func setDirection(forLayer gradientLayer: CAGradientLayer, direction: GradientDirection) {
             gradientLayer.startPoint = getStartPointForDirection(direction)
             gradientLayer.endPoint = getEndPointForDirection(direction)
         }
     }

 }
