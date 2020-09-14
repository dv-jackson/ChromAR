//
//  Palette.swift
//  ChromAR
//
//  Created by Tom Hansen on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation
import UIKit

class Palette {
    var palette: [UIColor]
    
    init () {
        palette = [UIColor]()
    }
    
    func addColor (color: UIColor) {
        if palette.count < 4 {
            palette.append(color)
        } else {
            palette[3] = color
        }
    }
    
    func removeColor (index: Int) {
        palette.remove(at: index)
    }
    
    func getPalette () -> [ColorWrapper] {
        var wrappedColors = [ColorWrapper]()
        for (i, color) in palette.enumerated() {
            wrappedColors.append(ColorWrapper(
                color: color,
                index: i,
                matched: false
            ))
        }
        return wrappedColors
    }
    
    // get palette, and 4 matched colors
    func getMatchedPalette () -> [ColorWrapper] {
        var wrappedColors = getPalette()
        for (i, color) in matchPalette(base: palette).enumerated() {
            wrappedColors.append(ColorWrapper(
                color: color,
                index: i,
                matched: true
            ))
        }
        return wrappedColors
    }
    
    // generate 4 colors based on palette
    func matchPalette (base: [UIColor]) -> [UIColor] {
        if base.count == 0 {
            return [UIColor.clear, UIColor.clear, UIColor.clear, UIColor.clear]
        }
        else {
            return []
        }
    }
}
