//
//  WeatherForecast.swift
//  WeatherApp
//
//  Created by Tatenda Kabike on 2019/11/30.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherForecast: Mappable{
    
    var cod: String?
    var message: Int?
    var cnt: String?
    var list: [List]?
    var city: City?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
       
        cod <- map["cod"]
        message <- map["message"]
        cnt <- map["cnt"]
        list <- map["list"]
        city <- map["city"]
        
    }
}


class City: Mappable{
    
    var id: Int?
    var name: String?
    var coord: Coordinates?
    var country: String?
    var timezone: Int?
    var sunrise: Int?
    var sunset: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        coord <- map["coord"]
        country <- map["country"]
        timezone <- map["timezone"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        
    }
    
}


class Coordinates: Mappable{
    
    var lat: Double?
    var lon: Double?
    
    required init?(map: Map) {
                
    }
    
    func mapping(map: Map) {
        
        
        lat <- map["lat"]
        lon <- map["lon"]
    }

}

class List: Mappable{
    
    var dt: Int?
    var main: MainClass?
    var weather: [ForeWeather]?
    var clouds: ForeCloud?
    var wind: ForeWind?
    var sys: ForeSys?
    var dt_txt: String?

    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        
        dt <- map["dt"]
        main <- map["main"]
        weather <- map["weather"]
        clouds <- map["clouds"]
        wind <- map["wind"]
        sys <- map["sys"]
        dt_txt <- map["dt_txt"]
    }
}

class MainClass: Mappable{
    
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var sea_level: Int?
    var grnd_level: Int?
    var humidity: Int?
    var temp_kf: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        temp <- map["temp"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        pressure <- map["pressure"]
        sea_level <- map["sea_level"]
        grnd_level <- map["grnd_level"]
        humidity <- map["humidity"]
        temp_kf <- map["temp_kf"]
        
    }
}

class Rain: Mappable{
    
    var threeH: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {

        threeH <- map["3h"]
    }
    
}

class ForecastSys: Mappable{
    
    var sys: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        sys <- map["sys"]
    }
}

class ForeWeather: Mappable{
    
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
        
    }
    
}

class ForeCloud: Mappable{
    
    var all: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        all <- map["all"]
        
    }
}

class ForeWind: Mappable{
    
    var speed: Double?
    var deg: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        speed <- map["speed"]
        deg <- map["deg"]
    }
}

class ForeSys: Mappable{
    
    var pod: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        pod <- map["pod"]
    }
}




