//
//  ViewController.swift
//  NovaPoshta
//
//  Created by Petro GOLISHEVSKIY on 28.03.2020.
//  Copyright © 2020 Petro GOLISHEVSKIY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let api = NovaPoshta()
    
    override func viewDidLoad() {
        super.viewDidLoad()

            api.countCities()
        
    }
}

