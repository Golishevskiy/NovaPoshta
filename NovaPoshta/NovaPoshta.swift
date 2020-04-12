//
//  NovaPoshta.swift
//  NovaPoshta
//
//  Created by Petro GOLISHEVSKIY on 28.03.2020.
//  Copyright © 2020 Petro GOLISHEVSKIY. All rights reserved.
//

import Foundation


class NovaPoshta {

    var arary = [Any].init()
    
    class func countCities(currentPage: Int, complition: @escaping (Answer) -> Void) {
        let urlString = "https://api.novaposhta.ua/v2.0/json/"
        let data: [String: Any] = [
            
            "modelName": "Address",
            "calledMethod": "getCities",
            "methodProperties": [
                "Page" : currentPage.description,
                "Limit" : "500"
            ]
        ]
    
        let jsonData = try? JSONSerialization.data(withJSONObject: data)
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            let answer = try? JSONDecoder().decode(Answer.self, from: data!)
            guard let res = answer else { return }
            complition(res)
                        
        }.resume()
    }
    
    class func getCount(complition: @escaping (String) -> Void) {
        let urlString = "https://api.novaposhta.ua/v2.0/json/"
            let data: [String: Any] = [
                
                "modelName": "Address",
                "calledMethod": "getCities",
                "methodProperties": [
                    "Page" : 1,
                    "Limit" : "1"
                ]
            ]
        
            let jsonData = try? JSONSerialization.data(withJSONObject: data)
            guard let url = URL(string: urlString) else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                let answer = try? JSONDecoder().decode(Answer.self, from: data!)
                guard let totalCount = answer?.info.totalCount else { return }
                complition(totalCount)
            }.resume()
    }
    
    class func loadAllCities(currentPage: Int, completion: @escaping (Cities) -> Void) {
        let urlString = "https://api.novaposhta.ua/v2.0/json/"
        guard let url = URL(string: urlString) else { return }
        
        let data: [String: Any] = [
            "modelName": "AddressGeneral",
            "calledMethod": "getWarehouses",
            "methodProperties": [
                "Page": currentPage.description,
                "Limit": "500"
            ],
            "apiKey": "bde180dca59155e550084a261a90e69e"
        ]
        
        let json = try? JSONSerialization.data(withJSONObject: data)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = json
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            let response = try? JSONDecoder().decode(Cities.self, from: data!)
            guard let answer = response else { return }
            completion(answer)
        }.resume()
    }
}
