//
//  MainViewController.swift
//  RGBView
//
//  Created by Roman Zhukov on 26.12.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewColor(_ rgbViewColor: UIColor)
}

class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.mainViewColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setViewColor(_ rgbViewColor: UIColor) {
        view.backgroundColor = rgbViewColor
    }
}
