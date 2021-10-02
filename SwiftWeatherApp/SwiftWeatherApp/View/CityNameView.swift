//
//  CityNameView.swift
//  SwiftWeatherApp
//
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                Text(city)
                    .font(.title)
                    .bold()
                Text(date)
            }
            .foregroundColor(.black)
        }
    }
}





