//
//  Weather.swift
//  FetchingWeather
//
//  Created by Damian on 30/11/2022.
//

import Foundation

struct WeatherRespone: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?
}
