//
//  FetchData.swift
//  SwiftUI-Weather
//
//  Created by Igor Max de Lima Nunes on 07/11/23.
//

import Foundation


func getData(cityName: String) async throws -> WeatherData {
    
    let endpoint = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=08d5a84435cfb99a71f7928482a746a1&units=metric"
    
    guard let url = URL(string: endpoint) else {
        throw GHError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw GHError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(WeatherData.self, from: data)
    } catch {
        throw GHError.invalidData
    }
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
