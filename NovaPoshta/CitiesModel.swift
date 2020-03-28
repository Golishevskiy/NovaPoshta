//
//  CitiesModel.swift
//  NovaPoshta
//
//  Created by Petro GOLISHEVSKIY on 28.03.2020.
//  Copyright © 2020 Petro GOLISHEVSKIY. All rights reserved.
//

import Foundation

struct Answer : Codable {
    let success : Bool
    let data : [Data]
    let errors : [String]
    let warnings : [String]
    let info : Info
    let messageCodes : [String]
    let errorCodes : [String]
    let warningCodes : [String]
    let infoCodes : [String]
}

struct Data : Codable {
    let description : String
    let descriptionRu : String
    let ref : String
    let area : String
    let settlementType : String
    let cityID : String
    let settlementTypeDescriptionRu : String
    let settlementTypeDescription : String

    enum CodingKeys: String, CodingKey {

        case description = "Description"
        case descriptionRu = "DescriptionRu"
        case ref = "Ref"
        case area = "Area"
        case settlementType = "SettlementType"
        case cityID = "CityID"
        case settlementTypeDescriptionRu = "SettlementTypeDescriptionRu"
        case settlementTypeDescription = "SettlementTypeDescription"
    }
}

struct Info : Codable {
    let totalCount : String?
}



