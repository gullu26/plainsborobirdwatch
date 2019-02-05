//
//  OpenWeatherMap.swift
//  Plainsboro Birdwatch
//
//  Created by Avyay Natarajan on 12/11/18.
//  Copyright © 2018 Avyay's Apps. All rights reserved.
//

import UIKit
import Foundation

let API_Key = "70cbc67c62f2b7fd1b18c178a8bccde0";

enum OpenWeatherMap {
    static func get(latitude: Float, longitude: Float, callback: @escaping (WeatherForecast) -> Void) {
        let url: URL! = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(API_Key)");
        
        var HTTPRequest: URLRequest! = URLRequest(url: url);
        HTTPRequest.httpMethod = "GET";
        
        let task = URLSession.shared.dataTask(with: HTTPRequest, completionHandler: {
            (data, headers, error) in
            guard let response = data, error == nil else {
                print("ERROR: \(String(describing: error))")
                callback(WeatherForecast())
                return
            }
            
            if let httpFormattedHeaders = headers as? HTTPURLResponse, httpFormattedHeaders.statusCode != 200 {
                callback(WeatherForecast())
                return
            } else {
                var jsonData: [String: Any] = self.parse(data: response);
                if (jsonData["error"] == nil) {
                    callback(WeatherForecast(json: jsonData))
                } else {
                    callback(WeatherForecast())
                }
            }
        });
        
        task.resume();
    }
    
    static func get(cityCode: Int, callback: @escaping (WeatherForecast) -> Void) {

        let url: URL! = URL(string: "http://api.openweathermap.org/data/2.5/weather?id=\(cityCode)&units=imperial,us&APPID=40e95f00517dc507947dce2b6f96626a");

        
        var HTTPRequest: URLRequest! = URLRequest(url: url);
        HTTPRequest.httpMethod = "GET";
        
        let task = URLSession.shared.dataTask(with: HTTPRequest, completionHandler: {
            (data, headers, error) in
            guard let response = data, error == nil else {
                print("ERROR: \(String(describing: error))")
                callback(WeatherForecast())
                return
            }
            
            if let httpFormattedHeaders = headers as? HTTPURLResponse, httpFormattedHeaders.statusCode != 200 {
                callback(WeatherForecast())
                return
            } else {
                var jsonData: [String: Any] = self.parse(data: response);
                if (jsonData["error"] == nil) {
                    callback(WeatherForecast(json: jsonData))
                } else {
                    callback(WeatherForecast())
                }
            }
        });
        
        task.resume();
    }
    
    
    static func parse(data: Data) -> [String: Any] {
        guard let jsonDecodedData = try?
            JSONSerialization.jsonObject(with: data, options: []) else {
                return [
                    "error": "Unparseable JSON"
                ] as! [String: Any]
        }
        
        var json: [String: Any]! = jsonDecodedData as! [String: Any]
        json["error"] = nil
        return json
    }
}
