//
//  CreateBoxEntryViewController.swift
//  Plainsboro Birdwatch
//
//  Created by Sudarshan Seshadri on 2/12/19.
//  Copyright © 2019 Avyay's Apps. All rights reserved.
//

import UIKit

class CreateBoxEntryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    

    
    @IBOutlet weak var boxNumberTextField: UITextField!
    
    @IBOutlet weak var activityTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var nestTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var eggsTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var nestlingsTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var speciesTextView: UITextView!
    
    @IBOutlet weak var birdImage: UIImageView!
    
    
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "goToBirdList", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        let secondController = segue.destination as! BirdListTableViewController
////        secondController.date = dateText.text!
////        secondController.tempInFahrenheit = Int(tempText.text!) ?? 0
////        secondController.wind = windText.text!
////        secondController.condition = conditionText.text!
//    }
    
    @IBAction func unwindToCreateBoxScreen (_ sender: UIStoryboardSegue)
    {
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "unwindDone") {
            let destVC = segue.destination as! CreateEntriesTableViewController
            if speciesTextView.text == ""
            {
                speciesTextView.text = "None"
            }
            if activityTextField.text == ""
            {
                activityTextField.text = "None"
            }
            if nestTextField.text == ""
            {
                nestTextField.text = "None"
            }

            destVC.completeLogEntry?.addEntry(boxNumber: Int(boxNumberTextField.text ?? "") ?? 0, species: speciesTextView.text ?? "None", activity: activityTextField.text ?? "None", nest: nestTextField.text ?? "None", eggs: Int(eggsTextField.text ?? "") ?? 0, nestlings: Int(nestlingsTextField.text ?? "") ?? 0)
            destVC.tableView.reloadData()
        }
        else if (segue.identifier == "unwindCancel") {
            
        }
        else if (segue.identifier == "goToBirdList") {
            
        }
    }
    
    
    var activityList = ["None", "Flying Around", "Courtship/Singing", "Nest Building", "Bringing Food to Young", "Fledging"]
    
    let ACTIVITY_TAG = 1
    
    var activityPicker =  UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityPicker.tag = ACTIVITY_TAG
        activityPicker.delegate = self
        activityTextField.inputView = activityPicker
        
        boxNumberTextField.font = UIFont.systemFont(ofSize: 46)
        setLabels()
        
        boxNumberTextField.keyboardType = UIKeyboardType.numberPad
        eggsTextField.keyboardType = UIKeyboardType.numberPad
        nestlingsTextField.keyboardType = UIKeyboardType.numberPad

        createKeyboardDoneToolbar()
        addDoneButtonOnNumericKeyboard()
        
        speciesTextView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(_ textView: UITextView) { //change the picture on the bird
        var birdList = BirdList().birdArray
        for b in birdList
        {
            if b.name==textView.text
            {
                birdImage.image = b.image
                return
            }
        }
        birdImage.image = UIImage(named: "Bird")
    }
    
    func setLabels()
    {
        activityTextField.placeholder = "Activity"
        activityTextField.title = "Activity"
        
        nestTextField.placeholder = "Nest Material"
        nestTextField.title = "Nest Material"
        
        eggsTextField.placeholder = "Number Of Eggs"
        eggsTextField.title = "Number Of Eggs"
        
        nestlingsTextField.placeholder = "Number Of Nestlings"
        nestlingsTextField.title = "Number Of Nestlings"
        
    }
    
    func addDoneButtonOnNumericKeyboard()
    {
        //Add done button to numeric pad keyboard
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(HomeViewController.dismissKeyboard))
        
        toolbarDone.items = [barBtnDone] // You can even add cancel button too
        boxNumberTextField.inputAccessoryView = toolbarDone
        nestlingsTextField.inputAccessoryView = toolbarDone
        eggsTextField.inputAccessoryView = toolbarDone
        
    }
    
    func createKeyboardDoneToolbar ()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(HomeViewController.dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        activityTextField.inputAccessoryView = toolbar
        nestTextField.inputAccessoryView = toolbar
        speciesTextView.inputAccessoryView = toolbar
        
        
    }
    
    @objc func dismissKeyboard ()
    {
        view.endEditing(true)
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
            return activityList.count
        }
        return activityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == CONDITION_TAG)
        {
            return activityList[row]
        }
        return activityList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView.tag == CONDITION_TAG)
        {
            activityTextField.text=activityList[row]
        }

        //self.view.endEditing(true)
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
