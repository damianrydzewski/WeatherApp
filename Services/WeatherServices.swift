//
//  WeatherServices.swift
//  FetchingWeather
//
//  Created by Damian on 30/11/2022.
//

import Foundation

enum WebserviceError: Error {
    case badURL
    case badRequest
}

final class WeatherService {
// Completion handler
    
//    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=3fd938143280226903ec43a28cf8a17e&units=metric") else {
//            completion(nil)
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data, error == nil else{
//                completion(nil)
//                return
//            }
//
//            let weatherRespone = try? JSONDecoder().decode(WeatherRespone.self, from: data)
//
//            if let weatherRespone {
//                let weather = weatherRespone.main
//                completion(weather)
//            } else {
//                completion(nil)
//            }
//        }
//        .resume()
//    }
//
    
    
// Swift Concurrency
//
// You have to put your own APP KEY from OpenWeather inside appid
    func requestWeather(city: String) async throws -> Weather {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid={appkey}&units=metric") else {
            throw WebserviceError.badURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw WebserviceError.badRequest
        }
        
        let weatherResponse = try JSONDecoder().decode(WeatherRespone.self, from: data)
        return weatherResponse.main
    }
    
    
}
