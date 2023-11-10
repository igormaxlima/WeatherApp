//
//  WeatherTypeView.swift
//  SwiftUI-Weather
//
//  Created by Igor Max de Lima Nunes on 10/11/23.
//

import SwiftUI

struct WeatherTypeView: View {
    @Environment(\.colorScheme) var colorScheme
    var logo: String
    var titleName: String
    var temperature: String
    
    var body: some View {
        HStack(spacing: 20) {
            
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(colorScheme == .dark ? Color(.white).opacity(0.2) : Color(.gray).opacity(0.1))
                .cornerRadius(50)
                .foregroundColor(colorScheme == .dark ? Color(hue: 0.656, saturation: 0.787, brightness: 0.354) : .blue)
                
            VStack(alignment: .leading, spacing: 5) {
                Text(titleName)
                    .font(.caption)
                    
                Text(temperature)
                    .font(.title).bold()
            }
            .foregroundColor(colorScheme == .dark ? Color(hue: 0.656, saturation: 0.787, brightness: 0.354) : .blue)
        }
        .frame(width: 160, height: 80)
    }
}

#Preview {
    WeatherTypeView(logo: "thermometer", titleName: "Feels Like", temperature: "18°")
}
