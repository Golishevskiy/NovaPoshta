//
//  NovaPoshta.swift
//  NovaPoshta
//
//  Created by Petro GOLISHEVSKIY on 28.03.2020.
//  Copyright © 2020 Petro GOLISHEVSKIY. All rights reserved.
//

import Foundation


class NovaPoshta {
    
    let urlString = "https://api.novaposhta.ua/v2.0/json/"
    
    func countCities() {
        let data: [String: Any] = [
            
            "modelName": "Address",
            "calledMethod": "getCities",
            "methodProperties": [
                "Page" : "1",
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
            print(res.info.totalCount)
        }.resume()
    }
}
