//
//  ContentView.swift
//  SwiftWeatherApp
//
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityVM = CityViewViewModel()
    @ObservedObject var monitor = NetworkMonitor()

    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityVM: cityVM)
                Spacer()
                ScrollView(showsIndicators: false){
                    CityView(cityVM: cityVM)
                }
            }
            .padding(.top, 30)
        }
        .background(RoundedRectangle(cornerRadius: 5)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: ($monitor.isNotConnected), content: {
        
            return  Alert(title: Text("No Internet Connection"), message: Text("Please enable wifi or Cellular data"), dismissButton: .default(Text("Cancel")))
        })
    }
}
            

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

