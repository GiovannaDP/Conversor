//
//  ViewController.swift
//  Conversores
//
//  Created by Giovanna Danelli Pau on 08/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueText: UITextField!
    @IBOutlet weak var unit1Button: UIButton!
    @IBOutlet weak var unit2Button: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultUnitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showNextButton(_ sender: UIButton) {
        switch titleLabel.text! {
            case "Temperatura":
                titleLabel.text = "Peso"
                unit1Button.setTitle("Kilograma", for: .normal)
                unit2Button.setTitle("Libra", for: .normal)
            case "Peso":
                titleLabel.text = "Moeda"
                unit1Button.setTitle("Real", for: .normal)
                unit2Button.setTitle("Dólar", for: .normal)
            case "Moeda":
                titleLabel.text = "Distância"
                unit1Button.setTitle("Metro", for: .normal)
                unit2Button.setTitle("Kilômetro", for: .normal)
            default:
                titleLabel.text = "Temperatura"
                unit1Button.setTitle("Celsius", for: .normal)
                unit2Button.setTitle("Fahrenheit", for: .normal)
        }
        convertButton(nil)
    }
    
    @IBAction func convertButton(_ sender: UIButton?) {
        if let sender = sender {
            if sender == unit1Button {
                unit2Button.alpha = 0.5
            } else {
                unit1Button.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch titleLabel.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        let result = Double(resultLabel.text!)
        resultLabel.text = String(format: "%.2f", result!)
    }
    
    
    func calcTemperature(){
        guard let temp = Double(valueText.text!) else { return }
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Fahrenheit"
            resultLabel.text = String(temp * 1.8 + 32.0)
        } else {
            resultUnitLabel.text = "Celsius"
            resultLabel.text = String((temp - 32.0) / 1.8)
        }
    }
    
    func calcWeight(){
        guard let weight = Double(valueText.text!) else { return }
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Libra"
            resultLabel.text = String(weight / 2.2046)
        } else {
            resultUnitLabel.text = "Kilograma"
            resultLabel.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency(){
        guard let currency = Double(valueText.text!) else { return }
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Dólar"
            resultLabel.text = String(currency / 5.27)
        } else {
            resultUnitLabel.text = "Real"
            resultLabel.text = String(currency * 5.27)
        }
    }
    
    func calcDistance(){
        guard let distance = Double(valueText.text!) else { return }
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Kilômetros"
            resultLabel.text = String(distance / 1000)
        } else {
            resultUnitLabel.text = "Metros"
            resultLabel.text = String(distance * 1000)
        }
    }
}

