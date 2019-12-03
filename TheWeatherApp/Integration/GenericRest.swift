//
//  GenericRest.swift
//  WeatherApp
//
//  Created by Tatenda Kabike on 2019/11/30.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

class GenericRest{
    
      static func getDataFromNetwork<T: Mappable>(urlString: String, completion: @escaping(T?, NSError?) -> Void) {
              Alamofire
              .request(urlString, method: .get, encoding: JSONEncoding.default)
              .validate(contentType: ["application/json"])
                .responseObject{(response: DataResponse<T>) in
                  
                  guard response.result.isSuccess else {
                      print("Error while fetching: \(response.result.error!)")
                      
                      completion(nil, response.result.error! as NSError)
                      
                      return
                  }
                  
                  if let responseObject = response.result.value {
                      
                      print(responseObject)
                      completion(responseObject, nil)
                  }
          }

      }
}
