//
//  FuziParse.swift
//  PugiSwiftComparisons
//
//  Created by Amy on 31/10/2024.
//

import Foundation
import Fuzi

struct Fuzi_Record {
    
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

struct FuziCoder_Records {
    
    var records: [Fuzi_Record] = []
    
}

func fuziParse(_ data: Data) -> Int {
    let document = try! Fuzi.XMLDocument(data: data)
    
    var records = FuziCoder_Records()
    let root = document.root!
    for child in root.children(tag: "record") {
        
        guard let _name = child.firstChild(tag: "name")?.stringValue else {
            fatalError()
        }
        guard let _phone = child.firstChild(tag: "phone")?.stringValue else {
            fatalError()
        }
        guard let _email = child.firstChild(tag: "email")?.stringValue else {
            fatalError()
        }
        guard let _address = child.firstChild(tag: "address")?.stringValue else {
            fatalError()
        }
        guard let _region = child.firstChild(tag: "region")?.stringValue else {
            fatalError()
        }
        guard let _postalZip = child.firstChild(tag: "postalZip")?.stringValue else {
            fatalError()
        }
        guard let _country = child.firstChild(tag: "country")?.stringValue else {
            fatalError()
        }
        guard let _list = child.firstChild(tag: "list")?.numberValue else {
            fatalError()
        }
        guard let _text = child.firstChild(tag: "text")?.stringValue else {
            fatalError()
        }
        guard let _numberrange = child.firstChild(tag: "numberrange")?.numberValue else {
            fatalError()
        }
        guard let _currency = child.firstChild(tag: "currency")?.stringValue else {
            fatalError()
        }
        let record = Fuzi_Record(name: _name, phone: _phone, email: _email, address: _address, region: _region, postalZip: _postalZip, country: _country, list: Int(truncating: _list), text: _text, numberrange: Int(truncating: _numberrange), currency: _currency)
        records.records.append(record)
    }
    return records.records.count
}
