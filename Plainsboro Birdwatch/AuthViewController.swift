//
//  HomeViewController.swift
//  Plainsboro Birdwatch
//
//  Created by Avyay Natarajan on 12/10/18.
//  Copyright © 2018 Avyay's Apps. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AuthViewController: ViewController {

    @IBOutlet weak var radialLoader: UIActivityIndicatorView!;
    var authorized: Bool!;
    
    let USER_ID_KEY = "UserID"
    
    override func viewDidLoad() {
        super.viewDidLoad();
        navigationItem.hidesBackButton = true  
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        radialLoader.startAnimating();
        let db = Firestore.firestore();
        db.collection("users").document(userID).getDocument(source: FirestoreSource.default, completion: { (snap, err) in
                if (snap==nil)
                {
                    userID = "N/A";
                    self.reject(message : "Please connect to the internet and try again.");
                }
                else if (snap!.exists) { //if user id exists and can move on
                    
                    //save the username to UserDefaults so it will load again later
                    
                    let preferences = UserDefaults.standard
                    //preferences.set(userID, forKey: self.USER_ID_KEY)
                    
                    
                    
                    self.radialLoader.stopAnimating();
                    self.performSegue(withIdentifier: "loadHomeScreen", sender: self);
                } else {
                    userID = "N/A";
                    self.reject(message : "We could not recognize the user ID you entered.");
                }
            }
        );
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reject(message : String) {
        let alert: UIAlertController! = UIAlertController(title: "Sorry", message: message, preferredStyle: .alert);
        let alertAction = UIAlertAction(title: "Go Back", style: UIAlertActionStyle.default, handler: { action in
            self.performSegue(withIdentifier: "rejectedAuthentication", sender: self)
        });
        alert.addAction(alertAction);
        self.present(alert, animated: true);
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
