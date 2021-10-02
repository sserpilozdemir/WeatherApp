//
//  DailyWeather.swift
//  SwiftWeatherApp
//
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var date: Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp = "temp"
        case weather
    }
    
    init() {
        date = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}


