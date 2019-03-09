//
//  CreateEntriesTableViewController.swift
//  Plainsboro Birdwatch
//
//  Created by Sudarshan Seshadri on 2/10/19.
//  Copyright © 2019 Avyay's Apps. All rights reserved.
//

import UIKit
import FirebaseFirestore


class CreateEntriesTableViewController: UITableViewController {
    
    var completeLogEntry : CompleteLogEntry?
    var date = String()
    var tempInFahrenheit = Int()
    var condition = String()
    var wind = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completeLogEntry = CompleteLogEntry(date: date, tempInFahrenheit: tempInFahrenheit, condition: condition, wind: wind)
        
        navigationItem.title=completeLogEntry?.condition
        
        //createSampleEntries()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    


    
    
    func createSampleEntries()
    {
        completeLogEntry?.addEntry(boxNumber: 1, species: "Generic", activity: "Tweet", nest: "None", eggs: 0, nestlings: 0)
        
        completeLogEntry?.addEntry(boxNumber: 1, species: "Chickadee", activity: "Eat", nest: "Straw", eggs: 0, nestlings: 5)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeLogEntry?.boxEntries.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "BirdBoxTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BirdBoxTableViewCell
            else {
            fatalError("The dequeued cell is not an instance of BirdBoxTableViewCell.")
        }
        
        let boxEntry = completeLogEntry?.getEntry(position: indexPath.row)
        
        cell.boxNumberLabel.text = "Box " + String(boxEntry?.boxNumber ?? 0)
        cell.birdNameLabel.text = boxEntry?.species
        cell.birdImageView.image = boxEntry?.birdImage
        
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // remove the item from the data model
            completeLogEntry?.deleteEntry(position: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
    @IBAction func unwindToEntriesTable (_ sender: UIStoryboardSegue)
    {
        
    }
    

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
