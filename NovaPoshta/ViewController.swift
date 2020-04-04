//
//  ViewController.swift
//  NovaPoshta
//
//  Created by Petro GOLISHEVSKIY on 28.03.2020.
//  Copyright © 2020 Petro GOLISHEVSKIY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayCities = [Data]()
    var array = [CityModel].init()
    let api = NovaPoshta()
    var iter = 0
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        api.getCount { (count) in
            guard let countItem = Int(count) else { return }
            self.count = Int(countItem)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for i in 0...count {
            self.iter += 1
            api.countCities(currentPage: iter) { (response) in
                print("Прилетіло \(response.data.count)")
                self.arrayCities += response.data
                print(self.arrayCities.count)
            }
        }
    }
    
    func start() {
        var answerIsEmpty = true
        api.countCities(currentPage: iter) { (response) in
            print("Прилетіло \(response.data.count)")
            self.arrayCities += response.data
            print(self.arrayCities.count)
        }
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        self.iter += 1
        api.countCities(currentPage: iter) { (response) in
            print("Прилетіло \(response.data.count)")
            self.arrayCities += response.data
            print(self.arrayCities.count)
        }
    }
    
    @IBAction func printButton(_ sender: UIButton) {
        for item in self.arrayCities {
            print(item.description)
        }
    }
}



