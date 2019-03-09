//
//  SingleBoxEntry.swift
//  Plainsboro Birdwatch
//
//  Created by Sudarshan Seshadri on 2/10/19.
//  Copyright © 2019 Avyay's Apps. All rights reserved.
//

import UIKit

class SingleBoxEntry {
    
    //MARK: Properties
    
    var boxNumber : Int
    var species : String
    var activity : String
    var nest : String
    //nest material
    
    var eggs : Int
    var nestlings : Int
    //number of eggs/nestlings
    
    var birdImage : UIImage?
    
    init(boxNumber : Int, species : String, activity : String, nest : String, eggs : Int, nestlings : Int) {
        
        self.boxNumber=boxNumber
        self.species=species
        self.activity=activity
        self.nest=nest
        self.eggs=eggs
        self.nestlings=nestlings
        birdImage = setBirdImage(birdName: species)
        //birdImage = UIImage(named: "Bird")!
        
    }
    
    func setBirdImage (birdName:String) ->UIImage
    {
        let birdList = BirdList()
        
        for b in birdList.birdArray
        {
            if (birdName==b.name)
            {
                return b.image
            }
            
        }
        return UIImage.init(named: "Bird")!
    }
    
}
