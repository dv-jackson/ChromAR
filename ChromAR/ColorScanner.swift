//
//  ColorScanner.swift
//  ChromAR
//
//  Created by Rithvik Arun on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

//ColorScanner is the rectangle in the middle of the application that detects color
class ColorScanner{
    
    let rectanglePositionX : CGFloat
    let rectanglePositionY : CGFloat
    let rectangleWidth : CGFloat
    let rectangleHeight : CGFloat
    
    init(rectanglePositionX : CGFloat, rectanglePositionY: CGFloat, rectangleWidth : CGFloat, rectangleHeight : CGFloat ) {
        self.rectanglePositionX = rectanglePositionX
        self.rectanglePositionY = rectanglePositionY
        self.rectangleWidth = rectangleWidth
        self.rectangleHeight = rectangleHeight
    }
    
    //Creates CGRectangle For Scanning Color
    func CreateColorScanner() -> UIView{
        let colorScanner = CGRect(x: rectanglePositionX, y: rectanglePositionY, width: rectangleWidth, height: rectangleHeight)
        let colorScannerView = UIView(frame: colorScanner)
        colorScannerView.backgroundColor = UIColor.clear
        return colorScannerView
    }
    
    //Takes A Snapshot Of Whats Within The ColorScanner
      func SnapShotOfColorScanner(view: UIView) -> UIImage{
          UIGraphicsBeginImageContextWithOptions(CGSize(width: rectangleWidth, height: rectangleHeight), false, 0)
          view.drawHierarchy(in: CGRect(x: -(rectangleWidth), y: -(rectangleHeight), width: view.bounds.size.width, height: view.bounds.size.height), afterScreenUpdates: false)
          let croppedShot : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
          return croppedShot;
      }
}

