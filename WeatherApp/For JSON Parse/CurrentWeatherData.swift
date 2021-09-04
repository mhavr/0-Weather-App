//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Максим Гаврилюк on 04.05.2021.
//

import Foundation



struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}


struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}



struct Weather: Decodable {
    let id: Int
}
