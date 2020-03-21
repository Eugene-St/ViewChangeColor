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
  
  @IBOutlet var labelsValue: [UILabel]!
  @IBOutlet var slidersValue: [UISlider]!
  @IBOutlet var textFieldsLabels: [UITextField]!
  
  @IBOutlet var doneButtonLabel: UIButton!
  
  // MARK: - Public properties
  var viewColorFromMainController: UIColor!
  var delegate: SettingsViewControllerDelegate!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setValueForSliders()
    updateLabelsValue()
    updateTextValues()
    
    colorViewLabel.backgroundColor = viewColorFromMainController
    colorViewLabel.layer.cornerRadius = 20
    doneButtonLabel.layer.cornerRadius = 20
    textFieldsLabels.forEach { $0.keyboardType = .numberPad }
  }
  
  // MARK: - IB Actions
  @IBAction func slidersAction() {
    setColor()
    updateLabelsValue()
    updateTextValues()
  }
  
  @IBAction func doneButtonPressed() {
    delegate.updateColor(colorViewLabel.backgroundColor ?? .white)
    dismiss(animated: true)
  }
}


// MARK: - Private methods
extension SettingsViewController {
  
  private func updateLabelsValue() {
    for (labelValue, sliderValue) in zip(labelsValue, slidersValue) {
      labelValue.text = String(Double(sliderValue.value))
    }
  }
  
  private func updateTextValues() {
    for (textValue, sliderValue) in zip(textFieldsLabels, slidersValue) {
      textValue.text = String(Double(sliderValue.value))
    }
  }
  
  private func setValueForSliders() {
    let ciColor = CIColor(color: viewColorFromMainController)
    let colors = [ciColor.red, ciColor.green, ciColor.blue]
    
    for (sliderValue, color) in zip(slidersValue, colors) {
      sliderValue.value = Float(color)
    }
  }
  
  private func setColor() {
    let newColor = UIColor(red: CGFloat(slidersValue.first?.value ?? 22),
                           green: CGFloat(slidersValue[1].value),
                           blue: CGFloat(slidersValue.last?.value ?? 22),
                           alpha: 1)
    
    colorViewLabel.backgroundColor = newColor
  }
  
}

// MARK: - Text Field Delegate
extension SettingsViewController: UITextFieldDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  /*
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
   for (_, sliderValue) in zip(textFieldsLabels, slidersValue) {
   sliderValue.value = Float(textField.text!)!
   }
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



