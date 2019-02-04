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
let db = Firestore.firestore();

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tempText: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        OpenWeatherMap.get(latitude: latitude, longitude: longitude, callback: {
            forecast in
            print("Date: \(forecast.date)\nTemperature: \(forecast.temperature)\nDesc: \(forecast.description)");

        });
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
