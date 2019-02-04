//
//  SettingsViewController.swift
//  Plainsboro Birdwatch
//
//  Created by Sudarshan Seshadri on 2/3/19.
//  Copyright © 2019 Avyay's Apps. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let USER_ID_KEY = "UserID"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LogOut(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: USER_ID_KEY)
        
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
