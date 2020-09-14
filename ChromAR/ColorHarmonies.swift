//
//  ColorHarmonies.swift
//  ChromAR
//
//  Created by Dj Jackson on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation
import UIKit

class ColorHarmonies
{
    //Want to get main color from AR Perspective
    //Then give Different Color Harmonies based off of suggested input
    
    var mainColor: UIColor
    var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
    
    init (mainColor: UIColor)
    {
        self.mainColor = mainColor
        mainColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) //sets the value of each of the color components
    }
    
    func getColor() -> UIColor
    {
        return mainColor
    }
    
    //Triadic Color Scheme
    func getTriadic() -> [[UIColor]]
    {
        let size: Int = 3
        var triColors = Array(repeating: Array<UIColor>(repeating: mainColor, count: size), count: size)
        
        triColors[0] = monoChrome(hueVal: hue);//passes the original color
        triColors[1] = monoChrome(hueVal: CGFloat((hue + 1/3) - 1))//passes the color to the first triadic color of the chosen color
        triColors[2] = monoChrome(hueVal: CGFloat((hue + 2/3) - 1))//passes the color to the second triadic color of the chosen color
        
        //returns an array of the same color in a triadic pattern
        return triColors
    }
    
    //Analogous Color Scheme
    func getAnalogous() -> [[UIColor]]
    {
        let size: Int = 3
        var analogousColors = Array(repeating: Array<UIColor>(repeating: mainColor, count: size), count: size)
        
        analogousColors[0] = monoChrome(hueVal: hue)//passes the original color
        analogousColors[1] = monoChrome(hueVal: CGFloat((hue + 1/12) - 1)) //passes the color to the right of the chosen color
        analogousColors[2] = monoChrome(hueVal: CGFloat((hue - 1/12) - 1)) //passes the color to the left of the chosen color
        
        //returns an array of the same color in an analogous pattern
        return analogousColors
    }
    
    //Changes how light or dark the color is
    func monoChrome(hueVal: CGFloat) -> [UIColor]
    {
        var i: Int = 0, size: Int = 3, dif: Double = 0.1
        var monoColors = Array<UIColor>(repeating:mainColor, count: size)
        
        while(i < size)
        {
            //Itterates to brighter than normal, normal, and darker than normal
            monoColors[i] = UIColor(hue: hueVal, saturation: saturation, brightness: brightness + CGFloat(dif), alpha: alpha)
            dif -= 0.1
            i += 1
        }
        
        //returns an array of the same color at different brightnesses
        return monoColors
    }
}
