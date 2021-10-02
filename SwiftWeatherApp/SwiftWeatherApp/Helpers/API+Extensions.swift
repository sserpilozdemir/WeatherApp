//
//  API+Extensions.swift
//  SwiftWeatherApp
//
//

import Foundation

extension API {
    
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    static let baseURLofMetaAPI = "https://www.metaweather.com/api/"
    
    static func getApiURLFor(lat: Double, lon: Double)->String{
        
        let s = "\(baseURLofMetaAPI)/location/search/?lattlong=\(lat),\(lon)"
        return s
    }
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        
        let s = "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=metric"
        print(s)
        return s
        
    }
}
