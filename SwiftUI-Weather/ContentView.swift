//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ajar Dahal on 11/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 59 : 76)
                
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                   temperature: isNight ? 55 : 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "cloud.rain.fill": "sun.max.fill",
                                   temperature: isNight ? 50: 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: isNight ? 58 : 65)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "moon.stars.fill": "sunset.fill",
                                   temperature: isNight ? 60 : 69)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: isNight ? "cloud.rain.fill": "sun.max.fill",
                                   temperature: isNight ? 53 : 90)
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    weatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: Color.white)
                }
                Spacer()
                
            }
        }
    }
}



#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing:8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
        
    }
}


