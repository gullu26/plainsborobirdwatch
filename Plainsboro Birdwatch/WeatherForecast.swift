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
    var conditionCode: Int!
    var condition : String!
    
    var fahrenheit: Int!;
    var celsius: Int!;
    var kelvin: Int!;
    
    var wind: String!;
    var windSpeed : Double!
    
    init(json: [String: Any]!) {
        self.date = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none);
        if (json["error"] != nil) {
            self.error = true;
        } else {
            var weather: [String : Any] = (json["weather"] as! [Any])[0] as! [String: Any];
            //var windInfo: [String : Any] = (json["wind"]) as! [String: Any];
            
            //var windInfo: [String : Any] = (json.) as! [String: Any];

            //var windInfo = (json["wind"] as! [Any]) as! [String:Any];
            
            self.description = weather["description"] as? String;
            self.conditionCode = weather["id"] as? Int;
            
            self.windSpeed =  ((json["wind"] as! [String: Any])["speed"]) as? Double;
            
            
            let kelvin: Double! = (json["main"] as! [String: Any])["temp"] as! Double!;
            let celsius: Double! = kelvin - 273.15;
            let fahrenheit: Double! = (celsius * 9/5) + 32;
            
            self.kelvin = Int(kelvin);
            self.celsius = Int(celsius);
            self.fahrenheit = Int(fahrenheit);
            
            self.wind = getWindText(speed: windSpeed)
            self.condition=getConditionText(conditionId: conditionCode)
        }
    }
    
    func getConditionText(conditionId:Int) -> String{
        
        
        if (conditionId == 804)//overcast
        {
            return "Overcast";
        }
        else if (conditionId >= 801 && conditionId <= 803 || conditionId == 711) //cloudy
        {
            return "Cloudy";
        }
        else if (conditionId >= 200 && conditionId <= 531) //all types of rain
        {
            return "Rainy";
        }
        else if (conditionId >= 600 && conditionId <= 622) //types of snow
        {
            return "Snow";
        }
        
        return "Cloudy";
    }
    
    func getWindText(speed : Double) -> String{
        //No Wind     0
        //Some Wind   1
        //Very Windy  2
        
        if (speed < 2.5)//no wind
        {
        return "No Wind";
        }
        else if (speed < 11) //some wind
        {
        return "Some Wind";
        }
        else if (speed >= 11) //very windy
        {
        return "Very Windy";
        }
        
        
        return "No Wind";
    
    }
    
    convenience init() {
        self.init(json: [
            "error": true
        ]);
    }
}
