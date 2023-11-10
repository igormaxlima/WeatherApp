//
//  ModelData.swift
//  SwiftUI-Weather
//
//  Created by Igor Max de Lima Nunes on 07/11/23.
//

import Foundation

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
    let wind: Wind
}

struct Main: Codable {
    let temp: Float
    let feelsLike: Float
    let tempMax: Float
    let tempMin: Float
}

struct Weather: Codable {
    let description: String
}

struct Wind: Codable {
    let speed: Float
}
