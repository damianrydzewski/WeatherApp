//
//  WeatherViewModel.swift
//  FetchingWeather
//
//  Created by Damian on 30/11/2022.
//

import Foundation

@MainActor
final class WeatherViewModel: ObservableObject {
    //PROPERTIES
    @Published private(set)var weather: Weather = Weather(temp: nil, humidity: nil)
    @Published var cityNameOf: String = ""
    private var weatherService: WeatherService
    
    
    
    //CONSTRUCTOR
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return " "
        }
    }

    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return " "
        }
    }
    
    
    
    //METHODS
    func search() async {
        if let city = self.cityNameOf.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            await fetchWeather(for: city)
        }
    }
    
    private func fetchWeather(for cityName: String) async {
        do {
            self.weather = try await self.weatherService.requestWeather(city: cityName)
        } catch {
            print("Error while fechting data from webservice.")
        }
    }
    
//    Older iOS verision
//    private func fetchWeather(by city: String) {
//        self.weatherService.getWeather(city: city) { weather in
//            if let weather {
//                self.weather = weather
//            }
//        }
//    }
}
