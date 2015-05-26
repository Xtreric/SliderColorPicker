//
//  ViewController.swift
//  SliderColorPicker
//
//  Created by Rohit Gurnani on 26/05/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var bgcolor: UILabel!
    @IBOutlet var redSlider: UISlider!
    
    
    @IBOutlet var backgroundcolorlabel: UILabel!
    
    @IBOutlet var hexcode: UILabel!
    @IBOutlet var hexcodelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redSlider.continuous = true
        blueSlider.continuous = true
        greenSlider.continuous = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeBackground(sender: AnyObject) {
        var red = redSlider.value
        var blue = blueSlider.value
        var green = greenSlider.value
        
        hexcode.text = String(format: "%02X", Int(red))+String(format: "%02X", Int(green))+String(format: "%02X", Int(blue))
        println(hexcode.text)
        
        
        
        bgcolor.text = "(\(Int(red)), \(Int(green)), \(Int(blue)))"
                var r : CGFloat = CGFloat(red/255)
        var b = CGFloat(blue/255)
        var g = CGFloat(green/255)
        self.view.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        //getting inverse UIColor for background color value
        let inversecolor = getInverseColor(r, g: g, b: b)
        bgcolor.textColor = UIColor(red: inversecolor.rinverse, green: inversecolor.ginverse, blue: inversecolor.binverse, alpha: 1.0)
        backgroundcolorlabel.textColor = UIColor(red: inversecolor.rinverse, green: inversecolor.ginverse, blue: inversecolor.binverse, alpha: 1.0)
        hexcodelabel.textColor = UIColor(red: inversecolor.rinverse, green: inversecolor.ginverse, blue: inversecolor.binverse, alpha: 1.0)
        hexcode.textColor = UIColor(red: inversecolor.rinverse, green: inversecolor.ginverse, blue: inversecolor.binverse, alpha: 1.0)

        
        
    }
    
    func getInverseColor(r : CGFloat,g : CGFloat,b : CGFloat) -> (rinverse : CGFloat , ginverse :CGFloat, binverse : CGFloat ){
        //
        var rinverse = 1.0 - r
        var binverse = 1.0 - b
        var ginverse = 1.0 - g
        return (rinverse, ginverse , binverse)
    }


}

