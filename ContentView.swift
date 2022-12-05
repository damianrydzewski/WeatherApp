//
//  ContentView.swift
//  FetchingWeather
//
//  Created by Damian on 30/11/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("The Weather")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.top, 10)
            
            TextField("Enter the city name", text: $vm.cityNameOf) {
                Task {
                    await vm.search()
                }
            }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            Spacer()
            
            VStack {
                Text("\(vm.cityNameOf)")
                    .font(.title)
                    .bold()
                Text("\(vm.temperature) Celsius")
                Text("\(vm.humidity) % humidity")
            }
            .padding(50)
            .background(Color.yellow.opacity(0.2))
            .cornerRadius(25)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
