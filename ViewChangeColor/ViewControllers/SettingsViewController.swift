//
//  SettingsViewController.swift
//  ViewChangeColor
//
//  Created by Eugene St on 07.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
  func updateColor(_ color: UIColor)
}

class SettingsViewController: UIViewController {
  
  // MARK: - IB Outlets
  @IBOutlet var colorViewLabel: UIView!
  
  @IBOutlet var redLabelValue: UILabel!
  @IBOutlet var greenLabelValue: UILabel!
  @IBOutlet var blueLabelValue: UILabel!
  
  @IBOutlet var redSliderValues: UISlider!
  @IBOutlet var greenSliderValues: UISlider!
  @IBOutlet var blueSliderValues: UISlider!
  
  @IBOutlet var textFieldsLabels: [UITextField]!
  
  @IBOutlet var doneButtonLabel: UIButton!
  
  // MARK: - Public properties
  var viewColorFromMainController: UIColor!
  var delegate: SettingsViewControllerDelegate!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    colorViewLabel.backgroundColor = viewColorFromMainController
    colorViewLabel.layer.cornerRadius = 20
    doneButtonLabel.layer.cornerRadius = 20
    textFieldsLabels.forEach { $0.keyboardType = .numberPad }
    
    /*
    sliderInitialValues()
    */
    
//    setValue(for: redLabelValue, greenLabelValue, blueLabelValue)
    
  }
  
  // MARK: - IB Actions
  @IBAction func slidersAction() {
    colorViewLabel.backgroundColor = UIColor(red: CGFloat(redSliderValues.value/255), green: CGFloat(greenSliderValues.value/255), blue: CGFloat(blueSliderValues.value/255), alpha: 1.0)
    
    redLabelValue.text = String(Int(redSliderValues.value))
    greenLabelValue.text = String(Int(greenSliderValues.value))
    blueLabelValue.text = String(Int(blueSliderValues.value))
  }
  
  @IBAction func doneButtonPressed() {
    delegate.updateColor(colorViewLabel.backgroundColor.self ?? .white)
    dismiss(animated: true)
  }
}
  
  
  // MARK: - Private methods
extension SettingsViewController {
  
  /*
  private func sliderInitialValues() {
    redSliderValues.value = 100
    redSliderValues.minimumValue = 0
    redSliderValues.maximumValue = 255
    
    greenSliderValues.value = 100
    greenSliderValues.minimumValue = 0
    greenSliderValues.maximumValue = 255
    
    blueSliderValues.value = 50
    blueSliderValues.minimumValue = 0
    blueSliderValues.maximumValue = 255
  }
  */
  
  /*
  private func setValue(for labels: UILabel ...) {
    labels.forEach { label in
      switch label.tag {
      case 0: redLabelValue.text = String(Int(redSliderValues.value))
      case 1: greenLabelValue.text = String(Int(greenSliderValues.value))
      case 2: blueLabelValue.text = String(Int(blueSliderValues.value))
      default: break
      }
    }
  }
  */
}

// MARK: - Text Field Delegate
extension SettingsViewController: UITextFieldDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  /*
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    <#code#>
  }
  */
  
}

// MARK: - Alert Controller
extension SettingsViewController {
  private func showAlert(with title: String, and message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    alert.addAction(okAction)
    present(alert,animated: true)
  }
}
  


