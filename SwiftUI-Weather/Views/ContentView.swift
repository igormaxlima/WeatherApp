//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Igor Max de Lima Nunes on 24/10/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var cityName: String = ""
    @State private var weather: WeatherData?
    @State private var isLoading: Bool = false
    @State private var isError: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            if isLoading {
                LoadingView()
            } else {
                if weather == nil {
                    VStack {
                        TitleTextView(title: "Welcome to the Weather App")
                        
                        DescriptionTextView(description: "Please share your current location to get the weather in your region")
                        
                        HStack {
                            CustomTextField(text: $cityName, placeholder: "Enter the name of the city", backgroundColor: colorScheme == .dark ? .gray.opacity(0.2) : .white.opacity(0.4), textColor: .white)
                            
                            Button {
                                isLoading = true
                                Task {
                                    do {
                                        weather = try await getData(cityName: cityName)
                                    } catch GHError.invalidURL {
                                        print("invalid URL")
                                    } catch GHError.invalidResponse {
                                        print("invalid response")
                                        isError = true
                                    } catch GHError.invalidData {
                                        print("invalid data")
                                    } catch {
                                        print("unexpected error")
                                    }
                                    isLoading = false
                                }
                            } label: {
                                Image(systemName: "location.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .padding(.leading, 5)
                            }
                        }

                        if isError {
                            Text("City not found, try again.")
                                .foregroundColor(.red)
                                .padding(.top, 10)
                        }
                    }
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                }
                
                if let weather = weather {
                    WeatherView(weather: weather)
                        .ignoresSafeArea(edges: .bottom)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

struct BackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ContainerRelativeShape()
            .fill(colorScheme == .dark ? Color(hue: 0.656, saturation: 0.787, brightness: 0.354).gradient : Color(.blue).gradient)
            .ignoresSafeArea()
    }
}

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(backgroundColor)
            
            HStack {
                TextField(placeholder, text: $text)
                    .foregroundColor(textColor)
            }
            
            
        }
        .frame(width: 270, height: 40)
        
    }
}


struct TitleTextView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .bold().font(.title)
            .padding(.horizontal, 10)
    }
}

struct DescriptionTextView: View {
    var description: String
    
    var body: some View {
        Text(description)
            .padding()
    }
}
