//
//  ViewController.swift
//  ViewChangeColor
//
//  Created by Eugene St on 07.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var mainViewColorable: UIView!
  
  @IBOutlet var redLabelValue: UILabel!
  @IBOutlet var greenLabelValue: UILabel!
  @IBOutlet var blueLabelValue: UILabel!
  
  @IBOutlet var redSliderValues: UISlider!
  @IBOutlet var greenSliderValues: UISlider!
  @IBOutlet var blueSliderValues: UISlider!
  
  @IBOutlet var backgroundButton: UIButton!
  
  @IBOutlet var colorsStack: UIStackView!
  @IBOutlet var valuesStack: UIStackView!
  @IBOutlet var slidersStack: UIStackView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    sliderInitialValues()
    mainViewInitialValues()
    buttonInitialValues()
    
    redLabelValue.text = String(redSliderValues.value)
    greenLabelValue.text = String(greenSliderValues.value)
    blueLabelValue.text = String(blueSliderValues.value)
  
    mainViewColorable.backgroundColor = UIColor(red: CGFloat(redSliderValues.value/255), green: CGFloat(greenSliderValues.value/255), blue: CGFloat(blueSliderValues.value/255), alpha: 1.0)
    
  }

  @IBAction func slidersAction() {
    mainViewColorable.backgroundColor = UIColor(red: CGFloat(redSliderValues.value/255), green: CGFloat(greenSliderValues.value/255), blue: CGFloat(blueSliderValues.value/255), alpha: 1.0)
    
    redLabelValue.text = String(Int(redSliderValues.value))
    greenLabelValue.text = String(Int(greenSliderValues.value))
    blueLabelValue.text = String(Int(blueSliderValues.value))
  }
  
  @IBAction func setBackgroundButton() {
    
//    mainViewColorable.backgroundColor = .white
    
    if !mainViewColorable.isHidden {
      view.backgroundColor = mainViewColorable.backgroundColor
      mainViewColorable.isHidden = true
      backgroundButton.setTitle("Update Background Color", for: .normal)
      colorsStack.isHidden = true
      valuesStack.isHidden = true
      slidersStack.isHidden = true
    } else {
      mainViewColorable.isHidden = false
      backgroundButton.setTitle("Set Background Color", for: .normal)
      colorsStack.isHidden = false
      valuesStack.isHidden = false
      slidersStack.isHidden = false
      mainViewColorable.backgroundColor = .white
    }
  }
  
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
  
  private func mainViewInitialValues() {
    mainViewColorable.layer.cornerRadius = 20
    mainViewColorable.layer.borderWidth = 3
    mainViewColorable.layer.borderColor = CGColor(srgbRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    mainViewColorable.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    mainViewColorable.layer.shadowColor = CGColor(srgbRed: 20.0, green: 154.0, blue: 49.0, alpha: 1.0)
  }
  
  private func buttonInitialValues() {
    backgroundButton.layer.cornerRadius = 20
  }
  
}

