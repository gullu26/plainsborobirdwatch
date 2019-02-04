//
//  LoginViewController.swift
//  Plainsboro Birdwatch
//
//  Created by Avyay Natarajan on 12/10/18.
//  Copyright © 2018 Avyay's Apps. All rights reserved.
//

import UIKit

var userID: String!;

class LoginViewController: ViewController {
    
    @IBOutlet weak var IDField: UITextField!;
    @IBOutlet weak var LoginButton: UIButton!;
    
    let USER_ID_KEY = "UserID"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: USER_ID_KEY) == nil {
            //  Doesn't exist
        } else {
            userID = preferences.object(forKey: USER_ID_KEY) as! String;
            performSegue(withIdentifier: "loadHomeScreen", sender: self);
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Login(_ sender: UIButton) {
        guard let key: String = IDField.text as String! else {
            return;
        }
        if (!key.isEmpty) {
            userID = key;
            performSegue(withIdentifier: "loadHomeScreen", sender: self);
        }
    }
    
}


