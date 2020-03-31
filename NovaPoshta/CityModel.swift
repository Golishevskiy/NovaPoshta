//
//  CityModel.swift
//  NovaPoshta
//
//  Created by Petro GOLISHEVSKIY on 30.03.2020.
//  Copyright © 2020 Petro GOLISHEVSKIY. All rights reserved.
//

import Foundation

struct Cities : Codable {
    let success : Bool
    let data : [CityModel]
//    let errors : [String]
//    let warnings : [String]
    let info : Information
//    let messageCodes : [String]
//    let errorCodes : [String]
//    let warningCodes : [String]
//    let infoCodes : [String]
}

struct CityModel : Codable {
    let siteKey : String
    let descriptionRu : String
    let shortAddressRu : String
    let phone : String
    let typeOfWarehouse : String
    let ref : String
    let number : String
    let cityRef : String
    let cityDescriptionRu : String
    
    let settlementRef : String
    let settlementDescription : String
    let settlementAreaDescription : String
    let settlementRegionsDescription : String
    let settlementTypeDescription : String
    
    let districtCode : String?
    let categoryOfWarehouse : String

    enum CodingKeys: String, CodingKey {

        case siteKey = "SiteKey"
        case descriptionRu = "DescriptionRu"
        case shortAddressRu = "ShortAddressRu"
        case phone = "Phone"
        case typeOfWarehouse = "TypeOfWarehouse"
        case ref = "Ref"
        case number = "Number"
        case cityRef = "CityRef"
        case cityDescriptionRu = "CityDescriptionRu"
        
        case settlementRef = "SettlementRef"
        case settlementDescription = "SettlementDescription"
        case settlementAreaDescription = "SettlementAreaDescription"
        case settlementRegionsDescription = "SettlementRegionsDescription"
        case settlementTypeDescription = "SettlementTypeDescription"
        
        case districtCode = "DistrictCode"
        case categoryOfWarehouse = "CategoryOfWarehouse"
    }
}

struct Information : Codable {
    let totalCount : Int
}
