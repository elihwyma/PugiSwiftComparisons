//
//  PugiParse.swift
//  PugiSwiftComparisons
//
//  Created by Amy on 31/10/2024.
//

import PugiSwift
import Foundation

@Node internal struct Pugi_Records {
    
    @Element(childrenCodingKey: "record") let records: [Pugi_Record]
    
}

@Node internal struct Pugi_Record {
    
    let name: String
    
    let phone: String
    
    let email: String
    
    let address: String
    
    let region: String
    
    let postalZip: String
    
    let country: String
    
    let list: Int
    
    let text: String
    
    let numberrange: Int
    
    let currency: String
    
}

internal func pugiParse(_ data: Data) -> Int {
    let parsed = try! Pugi_Records(from: data)
    return parsed.records.count
}
