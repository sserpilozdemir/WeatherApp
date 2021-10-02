//
//  MenuHeaderView.swift
//  SwiftWeatherApp
//
//
import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    @State private var searchTerm = "Istanbul"
    
    var body: some View {
        Spacer(minLength: 20)
        HStack() {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
            TextField("", text: $searchTerm)
                .padding(.leading, 20)
            
            Button {
                cityVM.city = searchTerm
            } label: {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    Image(systemName: "location.fill")
                }
            }.frame(width: 50, height: 50)
        }
        .foregroundColor(Color.black)
        .padding(10)
        .background(ZStack (alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

