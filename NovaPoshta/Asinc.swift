//
//  Asinc.swift
//  NovaPoshta
//
//  Created by Petro GOLISHEVSKIY on 04.04.2020.
//  Copyright © 2020 Petro GOLISHEVSKIY. All rights reserved.
//

import Foundation

class CountingPage: AsynchronousOperation {
    var resultCount: String?

    
    override func main() {
//        print("main function CountingPage")
        print("main function CountingPage \(Thread.current)")
        
        getCount { (count) in
                self.resultCount = count
            
        }
    }
    
        func getCount(complition: @escaping (String) -> Void) {
            print("getCount CountingPage")
            print(Thread.current)
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
                print("Closure URLRequest \(Thread.current)")
                let answer = try? JSONDecoder().decode(Answer.self, from: data!)
                guard let totalCount = answer?.info.totalCount else { return }
                complition(totalCount)
                self.finish()
            }.resume()
    }

}



class LoadDataNP: AsynchronousOperation {
    
    var answerAllCities = [Data].init()
    var iteration: Int
    
    init(iter: Int) {
        print("Init LoadDataNP")
        self.iteration = iter
        super.init()
    }
        
    override func main() {
        print("Main LoadDataNP")
        for i in 0...iteration {
            print("now is \(i)")
            countCities(currentPage: i)
        }
    }
    
    func countCities(currentPage: Int) {
        print("countCities LoadDataNP")
        print(Thread.current)
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
            self.answerAllCities.append(contentsOf: answer!.data)
            print("Count array is \(self.answerAllCities.count)")
        }.resume()
    }
}



