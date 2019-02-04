//
//  ViewController.swift
//  Plainsboro Birdwatch
//
//  Created by Avyay Natarajan on 12/10/18.
//  Copyright © 2018 Avyay's Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = UIColor(displayP3Red: CGFloat(1), green: CGFloat(1), blue: CGFloat(0.95), alpha: CGFloat(1))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false;
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
