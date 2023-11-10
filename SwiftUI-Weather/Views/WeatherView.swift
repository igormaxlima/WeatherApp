//
//  WeatherView.swift
//  SwiftUI-Weather
//
//  Created by Igor Max de Lima Nunes on 08/11/23.
//

import SwiftUI

struct WeatherView: View {
    @Environment(\.colorScheme) var colorScheme
    let weather: WeatherData
    
    var body: some View {
            VStack {
                VStack(alignment: .center, spacing: 5) {
                    CityTextView(cityName: weather.name)
                    
                    DateTextView()
                    
                    MainWeatherStatusView(imageName: colorScheme == .dark ? "moon" : "sun.max", description: weather.weather[0].description.capitalized)
                    
                    TemperatureTextView(temperature: Int(weather.main.temp))
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 40)
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    WeatherNowView(weather: weather)
                }
            }
            .background((colorScheme == .dark ? Image("night-sky") : Image("white-clouds")).resizable().scaledToFill().ignoresSafeArea())
            .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    WeatherView(weather: WeatherData(weather: [.init(description: "cloud")], main: .init(temp: 32, feelsLike: 29.0, tempMax: 35.0, tempMin: 25.0), name: "Brasilia", wind: .init(speed: 15)))
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var description: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
            Text(description)
                .font(.headline)
                .foregroundColor(.white)
            
            
        }
        .padding(.bottom, 40)
    }
}

struct DateTextView: View {
    var body: some View {
        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
            .fontWeight(.light)
            .foregroundColor(.white)
            .padding(.bottom, 20)
    }
}

struct TemperatureTextView: View {
    var temperature: Int
    
    var body: some View {
        Text("\(temperature)°")
            .font(.system(size: 110, weight: .bold))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherNowView: View {
    @Environment(\.colorScheme) var colorScheme
    var weather: WeatherData
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Weather Now")
                .bold().padding(.all, 5)
            WeatherTypeGridView(weather: weather)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.bottom, 25)
        .foregroundColor(Color(colorScheme == .dark ? Color(hue: 0.656, saturation: 0.787, brightness: 0.354) : .blue))
        .background(.white.opacity(0.6))
        .cornerRadius(25)
    }
}
