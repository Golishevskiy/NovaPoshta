//
//  LoadNovaPoshtasCitiesOperation.swift
//  NovaPoshta
//
//  Created by Petro GOLISHEVSKIY on 11.04.2020.
//  Copyright © 2020 Petro GOLISHEVSKIY. All rights reserved.
//

import Foundation

class LoadNovaPoshtasCitiesOperation: AsynchronousOperation {
    
    private let page: Int
    private let completion: (Cities) -> Void
    init(page: Int, completion: @escaping (Cities) -> Void) {
        self.page = page
        self.completion = completion
    }
    
    override func execute() {
        NovaPoshta.loadAllCities(currentPage: self.page) { [weak self] (cities) in
            guard let self = self else { return }
            if self.isCancelled {
                return
            }
            print("🏁 p: \(self.page) c: \(cities.data.count)")
            // 1. cities save to realm
            // 2. completion(cities)
            self.completion(cities)
            self.finish()
        }
    }
}
