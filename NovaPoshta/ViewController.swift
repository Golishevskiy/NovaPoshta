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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var x = 1
//        repeat {
//               print(1)
//           x += 1
//           } while x < 5
        
        var answerIsEmpty = false
        repeat {
            self.iter += 1
            
            api.countCities(currentPage: iter) { (response) in
                print("Прилетіло \(response.data.count)")
                self.arrayCities += response.data
                print(self.arrayCities.count)
                answerIsEmpty = response.data.isEmpty
            }
        }  while !answerIsEmpty
        
        
        
        
        
    }
    
    

    
    
    @IBAction func loadButton(_ sender: UIButton) {
        
        
        
        self.iter += 1
        
        api.countCities(currentPage: iter) { (response) in
//            print(response.info.totalCount)
            print("Прилетіло \(response.data.count)")
            self.arrayCities += response.data
            print(self.arrayCities.count)
        }
        
        
//            api.loadAllCities(currentPage: iter) { (cities) in
//                self.array += cities.data
//                print(self.array.count)
//            }
       }
    
    
    @IBAction func printButton(_ sender: UIButton) {
        for item in self.arrayCities {
            print(item.description)
        }
    }
    
}

