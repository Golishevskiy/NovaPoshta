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
    var novaposhtaQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        novaposhtaQueue.maxConcurrentOperationCount = 1
        
        NovaPoshta.getCount { [weak self] (totalCountOfTheCities) in
            
            let totalCount = Int(totalCountOfTheCities)
            var iteration = (totalCount! / 500) + 1

            for i in 0...iteration {
                let operation = LoadNovaPoshtasCitiesOperation(page: i) { (cities) in
                    self?.array += cities.data
                }
//
//                let operation1 = LoadNovaPoshtasCitiesOperation(page: i) { (cities) in
//                    // do stuff
//                }
//
//                let operation2 = LoadNovaPoshtasCitiesOperation(page: i) { (cities) in
//                    // do stuff
//                }
//                operation.queuePriority = .high
//                operation1.addDependency(operation)
//                operation2.addDependency(operation1)
                
                self?.novaposhtaQueue.addOperation(operation)
//                self?.novaposhtaQueue.addOperation(operation1)
//                self?.novaposhtaQueue.addOperation(operation2)
            }
            
        }

        
        /*
        queue.maxConcurrentOperationCount = 1
        let operation = CountingPage()
        queue.addOperation(operation)
        queue.addOperation {
            OperationQueue.main.addOperation {
                print(operation.resultCount)
                self.count = Int(operation.resultCount!)!
                print("ResultCount \(Thread.current)")
            }
        }
        
        let newOperation = LoadDataNP(iter: self.count)
        queue.addOperation {
            newOperation.iteration = self.iterationCount
               }
        queue.addOperation(newOperation)
*/
        
//        api.getCount { (count) in
//            guard let countItem = Int(count) else { return }
//            self.count = Int(countItem)
//        }
        
        
        
         
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        for i in 0...count {
//            self.iter += 1
//            api.countCities(currentPage: iter) { (response) in
//                print("Прилетіло \(response.data.count)")
//                self.arrayCities += response.data
//                print(self.arrayCities.count)
//            }
//        }
//    }
    
//    func start() {
//        var answerIsEmpty = true
//        api.countCities(currentPage: iter) { (response) in
//            print("Прилетіло \(response.data.count)")
//            self.arrayCities += response.data
//            print(self.arrayCities.count)
//        }
//    }
    
    @IBAction func loadButton(_ sender: UIButton) {
//        self.iter += 1
////        api.countCities(currentPage: iter) { (response) in
////            print("Прилетіло \(response.data.count)")
////            self.arrayCities += response.data
////            print(self.arrayCities.count)
////        }
    }
    
    @IBAction func printButton(_ sender: UIButton) {
        print("ButtonPrint")
        for item in self.array {
            print(item.cityDescriptionRu)
        }
    }
}



