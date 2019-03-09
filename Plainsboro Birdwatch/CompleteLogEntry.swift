//
//  CompleteLogEntry.swift
//  Plainsboro Birdwatch
//
//  Created by Sudarshan Seshadri on 2/10/19.
//  Copyright © 2019 Avyay's Apps. All rights reserved.
//

import UIKit

class CompleteLogEntry {
    //used to represent a whole day of logging! Not just one box, all the boxes in a session. Contains a bunch of single box entries.
    
    var boxEntries = [SingleBoxEntry]();
    var date : String
    var tempInFahrenheit : Int
    var condition : String
    var wind : String
    

    
    init (date : String, tempInFahrenheit : Int, condition : String, wind : String) {
        self.date = date;
        self.tempInFahrenheit = tempInFahrenheit;
        self.condition = condition;
        self.wind = wind;
    }
    
    func addEntry (boxNumber : Int, species : String, activity : String, nest : String, eggs : Int, nestlings : Int)
    {
        boxEntries.append(SingleBoxEntry(boxNumber: boxNumber, species: species, activity: activity, nest: nest, eggs: eggs, nestlings: nestlings))
    }
    
    func setEntry (position : Int, boxNumber : Int, species : String, activity : String, nest : String, eggs : Int, nestlings : Int)
    {
        boxEntries[position] = (SingleBoxEntry(boxNumber: boxNumber, species: species, activity: activity, nest: nest, eggs: eggs, nestlings: nestlings))
    }
    
    func getEntry (position : Int) ->SingleBoxEntry
    {
        return boxEntries[position]
    }
    
    func deleteEntry (position : Int)
    {
        boxEntries.remove(at: position)
    }

}
