//
//  WeatherTypeGridView.swift
//  SwiftUI-Weather
//
//  Created by Igor Max de Lima Nunes on 10/11/23.
//

import SwiftUI

struct WeatherTypeGridView: View {
    var weather: WeatherData
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            LazyHGrid(rows: gridLayout, spacing: 40) {
                WeatherTypeView(logo: "thermometer.low", titleName: "Temp Min", temperature: "\(Int(weather.main.tempMin))°")
                WeatherTypeView(logo: "wind", titleName: "Wind Speed", temperature: "\(Int(weather.wind.speed.rounded())) m/s")
                WeatherTypeView(logo: "thermometer.high", titleName: "Temp Max", temperature: "\(Int(weather.main.tempMax))°")
                WeatherTypeView(logo: "thermometer.variable.and.figure", titleName: "Feels Like", temperature: "\(Int(weather.main.feelsLike))°")
            }
            .frame(height: 200)
        }
    }
}

#Preview {
    WeatherTypeGridView(weather: WeatherData(weather: [.init(description: "cloud")], main: .init(temp: 32, feelsLike: 29.0, tempMax: 35.0, tempMin: 25.0), name: "Brasilia", wind: .init(speed: 9.0)))
}
