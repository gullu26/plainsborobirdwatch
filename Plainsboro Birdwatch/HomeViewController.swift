//
//  HomeViewController.swift
//  Plainsboro Birdwatch
//
//  Created by Avyay Natarajan on 12/10/18.
//  Copyright © 2018 Avyay's Apps. All rights reserved.
//

import UIKit
import CoreLocation
import FirebaseFirestore

let latitude: Float = 40.3514539;
let longitude: Float = -74.5688757;
let cityCode: Int = 5102729
let db = Firestore.firestore();

let WIND_TAG = 0
let CONDITION_TAG = 1

var windPicker =  UIPickerView()
var conditionPicker =  UIPickerView()


let conditionList = ["Clear", "Cloudy", "Overcast", "Rainy", "Snow"]
let windList = ["No Wind", "Some Wind", "Very Windy"]

let USER_SELECTION_TEXT_SIZE : CGFloat = 30



class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var dateText: UILabel!
    
    @IBOutlet weak var tempText: UITextField!
    
    @IBOutlet weak var windText: UITextField!
    
    @IBOutlet weak var conditionText: UITextField!
    
    @IBOutlet weak var letsGoButton: UIButton!
    
    @IBOutlet weak var unitsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        windPicker.tag = WIND_TAG
        conditionPicker.tag = CONDITION_TAG
        
        windPicker.delegate = self
        conditionPicker.delegate = self
        windText.inputView = windPicker
        conditionText.inputView = conditionPicker
        
        tempText.keyboardType = UIKeyboardType.numberPad
        
        createKeyboardDoneToolbar()
        addDoneButtonOnNumericKeyboard()
        
        increaseTextSizes()
        
        setUpDateText()
        
        
        OpenWeatherMap.get(cityCode: cityCode, callback: {
        //OpenWeatherMap.get(latitude: latitude, longitude: longitude, callback: {
            forecast in
            print("Date: \(forecast.date)\nTemperature: \(forecast.temperature)\nDesc: \(forecast.description)");
            
            DispatchQueue.main.async {
                self.tempText.text = String(forecast.temperature);
            }

        });
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func increaseTextSizes()
    {
        tempText.font = UIFont.systemFont(ofSize: USER_SELECTION_TEXT_SIZE)
        unitsText.font = UIFont.systemFont(ofSize: USER_SELECTION_TEXT_SIZE)
        
        conditionText.font = UIFont.systemFont(ofSize: USER_SELECTION_TEXT_SIZE)
        windText.font = UIFont.systemFont(ofSize: USER_SELECTION_TEXT_SIZE)
    }
    
    func addDoneButtonOnNumericKeyboard()
    {
        //Add done button to numeric pad keyboard
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(HomeViewController.dismissKeyboard))
        
        toolbarDone.items = [barBtnDone] // You can even add cancel button too
        tempText.inputAccessoryView = toolbarDone
        
    }
    
    
    
    func setUpDateText ()
    {
        
        dateText.adjustsFontSizeToFitWidth = true
        dateText.minimumScaleFactor = 0.2
        
        dateText.font = UIFont.boldSystemFont(ofSize: dateText.font.pointSize)
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdYYYY")
        dateText.text = dateFormatter.string(from: date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == CONDITION_TAG)
        {
            return conditionList.count
        }
        else if(pickerView.tag == WIND_TAG)
        {
            return windList.count
        }
        else
        {
            return conditionList.count
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == CONDITION_TAG)
        {
            return conditionList[row]
        }
        else if(pickerView.tag == WIND_TAG)
        {
            return windList[row]
        }
        else
        {
            return windList[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView.tag == CONDITION_TAG)
        {
            conditionText.text=conditionList[row]
        }
        else if(pickerView.tag == WIND_TAG)
        {
            windText.text=windList[row]
        }
        //self.view.endEditing(true)
    }
    
    func createKeyboardDoneToolbar ()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(HomeViewController.dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        conditionText.inputAccessoryView = toolbar
        windText.inputAccessoryView = toolbar
        
        
    }
    
    @objc func dismissKeyboard ()
    {
        view.endEditing(true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}



