//
//  XMLCoder.swift
//  PugiSwiftComparisons
//
//  Created by Amy on 31/10/2024.
//

import Foundation
import XMLCoder

struct XMLCoder_Record: Codable {
    
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

struct XMLCoder_Records: Codable {
    
    let records: [XMLCoder_Record]
    
}

func xmlCoderParse(_ data: Data) -> Int {
    let records = try! XMLDecoder().decode(XMLCoder_Records.self, from: data)
    return records.records.count
}
