//
//  EmployViewModel.swift
//  CachePOC
//
//  Created by Harsh Rajput on 01/06/20.
//  Copyright © 2020 Harsh Rajput. All rights reserved.
//

import Foundation
import Cache
import Alamofire
class CoffeeViewModel:NSObject{
    static let shared = CoffeeViewModel()
    private override init() {
    }
    
    
    func getEmployees( completion: @escaping (Coffees)->()){
        //http://coffee.datausadev.com/api/getCoffeeBrands
        AF.request("http://coffee.datausadev.com/api/getCoffeeBrands").responseString { response in
            do {
                guard let rData = try response.result.get() as? String else{return}
                
                if let cData = UserDefaults.standard.value(forKey: "cacheEmploy") as? String{
                    if rData == cData{
                        return
                    }
                }
                UserDefaults.standard.set(rData, forKey: "cacheEmploy")
                let user = try JSONDecoder.decode(rData, to: Coffees.self)
                completion(user)
                
            
            
        } catch {
            print(error)
        }
    }
    
    
}
}
