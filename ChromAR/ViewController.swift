//
//  ViewController.swift
//  ChromAR
//
//  Created by Rithvik Arun on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var colorScanner = ColorScanner(rectanglePositionX: 68, rectanglePositionY: 249, rectangleWidth: 250, rectangleHeight: 250)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/colorScanner.scn")!
        // Set the scene to the view
        sceneView.scene = scene
        
            
        //Adds ColorScanner To View
        self.view.addSubview(colorScanner.CreateColorScanner())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         //Create a session configuration
        let configuration = ARImageTrackingConfiguration()

         //Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    //Uses ColorScanner class to create instance of CGRectangle
    func AddColorScannerRectangle() -> UIView{
        let colorScanner = ColorScanner(rectanglePositionX: 68, rectanglePositionY: 249, rectangleWidth: 250, rectangleHeight: 250)
        return colorScanner.CreateColorScanner()
    }
    
    var count = 0
     func session(_ session: ARSession, didUpdate frame: ARFrame) {
          count+=1
          if count % 250 == 0 {
              let image = colorScanner.SnapShotOfColorScanner(view: self.view)
          }
          print("Updated")
      }
}

