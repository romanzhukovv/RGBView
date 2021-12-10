//
//  ViewController.swift
//  RGBView
//
//  Created by Roman Zhukov on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redValueLabel.text = String(format: "%.2f",
                                    redSlider.value)
        greenValueLabel.text = String(format: "%.2f",
                                      greenSlider.value)
        blueValueLabel.text = String(format: "%.2f",
                                     blueSlider.value)
    }
    
    override func viewWillLayoutSubviews() {
        rgbView.layer.cornerRadius = 20
    }

    @IBAction func redSliderAction() {
        redValueLabel.text = String(format: "%.2f",
                                    redSlider.value)
        rgbView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f",
                                      greenSlider.value)
        rgbView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
        
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f",
                                     blueSlider.value)
        rgbView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
}

