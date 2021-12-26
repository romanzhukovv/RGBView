//
//  ViewController.swift
//  RGBView
//
//  Created by Roman Zhukov on 10.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueTF: UITextField!
    @IBOutlet var greenValueTF: UITextField!
    @IBOutlet var blueValueTF: UITextField!
    
    @IBOutlet var doneButton: UIButton!
    
    var mainViewColor: UIColor!
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    
    }

    @IBAction func slidersAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            sliderAction(colorValueLabel: redValueLabel,
                         colorValueTF: redValueTF,
                         colorSlider: redSlider)
        case greenSlider:
            sliderAction(colorValueLabel: greenValueLabel,
                         colorValueTF: greenValueTF,
                         colorSlider: greenSlider)
        default:
            sliderAction(colorValueLabel: blueValueLabel,
                         colorValueTF: blueValueTF,
                         colorSlider: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        if let rgbViewColor = rgbView.backgroundColor {
            delegate.setViewColor(rgbViewColor)
        }
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else {
            showAlert(title: "Wrong format!", message: "Please enter correct value", textField: textField)
            return }
        
        if numberValue < 0 || numberValue > 1 {
            showAlert(title: "Wrong value!", message: "Please enter value frome range 0...1", textField: textField)
            return
        }
        
        if textField == redValueTF {
            redValueLabel.text = String(format: "%.2f", numberValue)
            redSlider.setValue(numberValue, animated: true)
        } else if textField == greenValueTF {
            greenValueLabel.text = String(format: "%.2f", numberValue)
            greenSlider.setValue(numberValue, animated: true)
        } else {
            blueValueLabel.text = String(format: "%.2f", numberValue)
            blueSlider.setValue(numberValue, animated: true)
        }
        
        rgbView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    private func sliderAction(colorValueLabel: UILabel, colorValueTF: UITextField ,colorSlider: UISlider) {
        colorValueLabel.text = String(format: "%.2f", colorSlider.value)
        colorValueTF.text = String(format: "%.2f", colorSlider.value)
        rgbView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    private func showAlert(title: String, message: String, textField: UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func initialSetupUI() {
        rgbView.layer.cornerRadius = 20
        doneButton.layer.cornerRadius = 10
        
        rgbView.backgroundColor = mainViewColor
        
        let rgbComponent = CIColor(color: mainViewColor)
        
        setupSliders(rgbComponent: rgbComponent)
        setupLabels()
        setupTextFields()
    }
    
    private func setupSliders(rgbComponent: CIColor) {
        redSlider.value = Float(rgbComponent.red)
        greenSlider.value = Float(rgbComponent.green)
        blueSlider.value = Float(rgbComponent.blue)
    }
    
    private func setupLabels() {
        redValueLabel.text = String(format: "%.2f",
                                    redSlider.value)
        greenValueLabel.text = String(format: "%.2f",
                                      greenSlider.value)
        blueValueLabel.text = String(format: "%.2f",
                                     blueSlider.value)
    }
    
    private func setupTextFields() {
        redValueTF.text = String(format: "%.2f",
                                    redSlider.value)
        greenValueTF.text = String(format: "%.2f",
                                      greenSlider.value)
        blueValueTF.text = String(format: "%.2f",
                                     blueSlider.value)
    }
}

