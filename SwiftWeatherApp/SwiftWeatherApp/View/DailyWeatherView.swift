//
//  DailyWeatheView.swift
//  SwiftWeatherApp
//
//

import SwiftUI

struct DailyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel

    var body: some View {
        ForEach(cityVM.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
    
    private func dailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityVM.getDayFor(timestamp: weather.date).uppercased())
                .frame(width: 50)
            
            Spacer()
            
            Text("\(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min)) °C")
                .frame(width: 150)
            
            Spacer()
            
            cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y:-2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y:2)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

