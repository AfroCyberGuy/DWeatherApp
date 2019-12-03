//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Tatenda Kabike on 2019/11/30.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.
//

import Foundation
import ObjectMapper

class CurrentWeather: Mappable{
    
    var coord: Coord?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone: Int?
    var name: String?
    var cod: Int?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        sys <- map["sys"]
        timezone <- map["timezone"]
        name <- map["name"]
        cod <- map["code"]
    }
    
}

// MARK: - Clouds
class Clouds: Mappable{
    
    var all: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        all <- map["all"]
        
    }
}

// MARK: - Coord
class Coord: Mappable {
    
    var lat: Int?
    var lon: Int?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        
        lat <- map["lat"]
        lon <- map["lon"]
        
    }
}


// MARK: - Main
class Main: Mappable{
    
    var temp: Double?
    var pressure: Int?
    var humidity: Int?
    var tempMin: Double?
    var tempMax: Double?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        temp <- map["temp"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
    }
}

// MARK: - Sys
class Sys: Mappable{
    
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        type <- map["type"]
        id <- map["id"]
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}

// MARK: - Weather
class Weather:Mappable{
    
    var id: Int?
    var main: String?
    var weatherDescription: String?
    var icon: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        main <- map["main"]
        weatherDescription <- map["description"]
        icon <- map["icon"]
        
    }
}

// MARK: - Wind
class Wind: Mappable{
    
    var speed: Double?
    var deg: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        speed <- map["speed"]
        deg <- map["deg"]
        
    }
    
}
