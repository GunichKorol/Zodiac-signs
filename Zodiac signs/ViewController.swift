//
//  ViewController.swift
//  Zodiac signs
//
//  Created by Kirill Gunich-Korol on 20.12.21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var tfDay: UITextField!
    @IBOutlet weak var tfMonth: UITextField!
    @IBOutlet weak var buttonCheck: UIButton!
    
    let array = Array(1...31)
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDay.inputView = pickerView
        tfMonth.inputView = pickerView
        pickerView.dataSource = self
        pickerView.delegate = self
        tfDay.textAlignment = .center
        tfDay.placeholder = "Select day"
        tfMonth.textAlignment = .center
        tfMonth.placeholder = "Select month"
        pickerView.backgroundColor = .systemOrange
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if tfMonth.isFirstResponder == true {
            return (array.count) - 19 }
        else {
            return array.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(array[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if tfDay.isFirstResponder == true {
        tfDay.text = "\(array[row])"
            tfDay.resignFirstResponder()}
        else {
            tfMonth.text = "\(array[row])"
            tfMonth.resignFirstResponder()
        }
    }

    @IBAction func check(_ sender: Any) {
        guard let day = Int(tfDay.text!),
              let month = Int(tfMonth.text!)
        else{return}
        switch (month){
        case 1 : if day <= 20 {labelResult.text = "Capricorn"}
                 else{labelResult.text = "Aquarius"}
        case 2 : if day <= 19 {labelResult.text = "Aquarius"}
                 else{labelResult.text = "Fishes"}
        case 3 : if day <= 20 {labelResult.text = "Fishes"}
                 else{labelResult.text = "Aries"}
        case 4 : if day <= 20 {labelResult.text = "Aries"}
                 else{labelResult.text = "Taurus"}
        case 5 : if day <= 21 {labelResult.text = "Taurus"}
                 else{labelResult.text = "Twins"}
        case 6 : if day <= 21 {labelResult.text = "Twins"}
                 else{labelResult.text = "Crayfish"}
        case 7 : if day <= 22 {labelResult.text = "Crayfish"}
                 else{labelResult.text = "Lion"}
        case 8 : if day <= 21 {labelResult.text = "Lion"}
                 else{labelResult.text = "Virgo"}
        case 9 : if day <= 23 {labelResult.text = "Virgo"}
                 else{labelResult.text = "Scales"}
        case 10 : if day <= 23 {labelResult.text = "Scales"}
                 else{labelResult.text = "Scorpion"}
        case 11 : if day <= 22 {labelResult.text = "Scorpion"}
                 else{labelResult.text = "Sagittarius"}
        case 12 : if day <= 22 {labelResult.text = "Sagittarius"}
                 else{labelResult.text = "Capricorn"}
        default:break
    }
        
    }
    
}

