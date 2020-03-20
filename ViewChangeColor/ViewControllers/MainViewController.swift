//
//  MainViewController.swift
//  ViewChangeColor
//
//  Created by Eugene St on 20.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let settingsVC = segue.destination as! SettingsViewController
      settingsVC.viewColorFromMainController = view.backgroundColor
      settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
  func updateColor(_ color: UIColor) {
    view.backgroundColor = color
  }
}
