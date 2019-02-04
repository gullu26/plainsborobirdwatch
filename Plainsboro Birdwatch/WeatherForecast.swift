//
//  WeatherForecast.swift
//  Plainsboro Birdwatch
//
//  Created by Avyay Natarajan on 12/11/18.
//  Copyright © 2018 Avyay's Apps. All rights reserved.
//

import Foundation

class WeatherForecast {
    var error: Bool! = false;
    var date: String!;
    var description: String!;
    var temperature: Int!;
    var wind: String!;
    
    init(json: [String: Any]!) {
        self.date = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none);
        if (json["error"] != nil) {
            self.error = true;
        } else {
            var weather: [String : Any] = (json["weather"] as! [Any])[0] as! [String: Any];
            self.description = weather["description"] as! String;
            
            let kelvin: Double! = (json["main"] as! [String: Any])["temp"] as! Double!;
            let celsius: Double! = kelvin - 273.15;
            let fahrenheit: Double! = (celsius * 9/5) + 32;
            
            self.temperature = Int(fahrenheit);
        }
    }
    
    convenience init() {
        self.init(json: [
            "error": true
        ]);
    }
}
